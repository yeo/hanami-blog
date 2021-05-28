---
title: "The Joy of Python"
date: 2021-05-02T09:08:34-07:00
draft: true
---

Before we move further in this post, I want to say that Python is a
great general programming language purpose. To name a few thing that I
think is quite impressive with Python is node-gyp, smtpd package.

The decorator system of Python is great and I see no match to it among
Ruby, Python, Go, NodeJS.

Therefore, please read this post at a fun show about your neighbor which
I'm sure everyone in their life has a funny story about their neighbors.

The target audience of this post is to someone who is new to Python and
want to have some fun. That's it. If you're an Python expert, this won't
serve you well.

# The indent

One cannot rant about Python without its indentation based syntax.
Imagine you have this kind of code

```
if foo:
  do_this()

if is_beta:
  do_that()
```

Then by the time the beta feature is ready to graduate you remove `if
is_beta`. You're too excited. You did just this : 


```
if foo:
  do_this()

#if is_beta:
  do_that()
```

Then `do_that` will never come because it fall under `if foo:`.


# The time

You received timestamp from some JSON backend and you do this because
well, JSON has no type for time, just string

```
d
```


# The default arguments

These is well-known gotcha in Python. But if you're new, they are fun:

What you wrote:

```
def append_to(element, to=[]):
    to.append(element)
    return to
```

What You Might Have Expected to Happen

```
my_list = append_to(1)
print(my_list)

my_other_list = append_to(2)
print(my_other_list)
```

What do you think my_other_list will be? [1] or [1,2]. The answer is
[1,2]. Python’s default arguments are evaluated once when the function is defined, not each time the function is called (like it is in say, Ruby). This means that if you use a mutable default argument and mutate it, you will and have mutated that object for all future calls to the function as well.

