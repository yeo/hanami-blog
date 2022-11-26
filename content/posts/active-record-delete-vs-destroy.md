---
title: "Active Record Delete vs Destroy"
date: 2021-06-26T09:06:40-07:00
draft: true
---

Have you ever try to destroy an object in Rails and unable to do so and
out of no where your Rails console just quit with a message

```
Killed
```

Usually this occurs because the process consume too much memory and the
Linux OOM kicked in.

in Rails, we have two way to delete an object

## destroy

Deletes the record in the database and freezes this instance to reflect that no changes should be made (since they can't be persisted).

There's a series of callbacks associated with destroy. In other words,
destroy is a heavy way of deleting thing, it will also load all
association object and delete them. If you have a `has_many` relation
ships, it iterator over each of them, fetch each of row and construct a
Ruby object. And before the Ruby GC kicked in, all of that memory are
wasted just to throw object.

The reason for that behaviour is that Rails want to invoke callback.

After the destroying, Rails return the model, though you cannot made
change but you still have the model object with you.

```
2.7.2 :002 > u = User.order(id: :desc).first
 => #<User id: 14, created_at: "2021-07-13 20:07:59.526057000 +0000", updated_at: "2021-07-13 20:08:12.451746000 +0000", email:...
2.7.2 :003 > a = u.destroy
 => #<User id: 14, created_at: "2021-07-13 20:07:59.526057000 +0000", updated_at: "2021-07-13 20:08:12.451746000 +0000", email:...
2.7.2 :004 > a
 => #<User id: 14, created_at: "2021-07-13 20:07:59.526057000 +0000", updated_at: "2021-07-13 20:08:12.451746000 +0000", email: "3dad@dad.com", superuser: false, name: "hoahd", metadata: nil, lock_version: 2, status: "activated", otp_secret: nil>
```

What if you don't use callback at all? Or what if you just want a simple
`DELETE FROM table where id = ?` query send to yoru database?

Meet `delete`.

## delete

when you can `delete` on an object, Rails basically send this query to database

```
DELETE FROM table where id = ?
```

and that's it. as in below log, you can see Rails send the query to
database:

```
2.7.2 :008 > e  = Email.last
  Email Load (9.7ms)  SELECT "mails".* FROM "mails" ORDER BY "mails"."id" DESC LIMIT $1  [["LIMIT", 1]]
 => #<Email id: 8229, from: "vinh@dauhu.com", subject: "batch 2 seq 46. 2021-07-12 20:51:43.658692 -0700 P...", origin: "127.0....
2.7.2 :009 > a = e.delete
Email Destroy (9.9ms)  DELETE FROM "mails" WHERE "mails"."id" = $1  [["id", 8229]]
```

## has_many

Imagine this `User` class

```
class User
  has_many :user_plans
end
```

Now, let's try to delete a user:

```
2.7.2 :012 > u.delete
  User Destroy (3.6ms)  DELETE FROM "users" WHERE "users"."id" = $1  [["id", 13]]
Traceback (most recent call last):
        2: from (irb):11
        1: from (irb):12:in `rescue in irb_binding'
ActiveRecord::InvalidForeignKey (PG::ForeignKeyViolation: ERROR:  update or delete on table "users" violates foreign key constraint "fk_rails_45da853770" on table "user_plans")
DETAIL:  Key (id)=(13) is still referenced from table "user_plans".
```

Error! As expected, Rails just sending a `delete` statement to Postgres,
and it's error out because we have a row in `user_plans` refer to this
user.

By default, when `delete`
