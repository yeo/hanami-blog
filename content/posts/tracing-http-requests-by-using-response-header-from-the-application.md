---
title: "Tracing Http Requests by Using Response Header From the Application"
date: 2021-05-30T23:30:01-07:00
draft: false

categories: ["devops"]
tags: ["nginx", "log"]

---

# The problem

When our users send a support tickets, we usually want to see what the
user did, what step they made to try re-produce the problems. Or
sometime an error popup in our error tracking tool, and we would like to
see what our user did to re-produce it.

Or sometime if we detect that user is repeated trying to do some
actions, it could mean a feature didn't work as expected and our users
is frustrated to do something, we will see and fix it.

As an email forwarding services, our users have to update DNS, wait until
DNS is propagated, sometime the DNS looked to be updated on their side
but didn't on our end and user repeatedly click re-check DNS button. We
would love to track how often this occurs.

We can add client tracking code, or server side tracking code. But being
an email forwarding service, we try to honor our user privacy, we have
no client side tracking.

On server side, we can inserts event such as request path, request user
into an "event" table but this has some overhead and we don't want to
waste our databse storage either.

# The solution

We turned to our Nginx log, since nginx already log request, we made our
app emit a "trace-uid" header in the response, and nginx log the request
together with the user id.

When debugging we can simply do:

```
tail -f aceess.log | grep "uid:trace-user-id"
```

We also don't want to show this to end-user, so we will clean this from
the response that we send to client.

## Application code

In our root controller we have this:


```
class DashboardController < ActionController::Base
  after_action :set_header

  def set_header
    if user_signed_in?
      response.set_header("trace-uid", current_user.trace_id)
    end
  end
end
```

## Nginx config

To make log manipulation easiser, we use JSON log and we configure
this.

```
http {
  log_format json_combined escape=json
    '{'
    '"uid":"$upstream_http_trace_uid",'
  '}';
  access_log /var/log/nginx/access.log json_combined;

  server {
    location app {
      proxy_pass        http://app;
      proxy_hide_header trace-uid;
    }
  }
}
```

The variable `$upstream_http_trace_uid` is what upstream send back to
us, and in server block, we use
[proxy_hide_header](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_hide_header_ to cleanup *trace-uid* header before sending response back to client.

And this technique work great to help us identify user flow when
response to support request.

### Note: Why current_user.trace_id instead of current_user.id

We can simply set a `user_id` but to avoid any potential issue with
GDPR. We opt to use a simple `trace_id` that automatically rolled up
every 7 days. We won't be able to follow request split between two
7-days windows but it's a trade-off we made.

The `trace_id` is a simple hash of user id with a salt that is changed
every 7 days.

I hope you found it userful.
