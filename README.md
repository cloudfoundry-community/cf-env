# Display Cloud Foundry environment variables

<img src="https://raw.github.com/cloudfoundry-community/cf-env/master/docs/images/demo.png" />

A simple Sinatra application. Once deployed to Cloud Foundry, it will echo the Environment and HTTP Request Headers.

This is especially useful to learn about service connection details (`$VCAP_SERVICES`) being passed to an application. Create them, bind them to this running application, and you'll see the nested JSON string that is set in `$VCAP_SERVICES`.

## Deploy

The repo contains a manifest file which creates a new application called `cfenv`, with a random string in the URL to avoid collisions.

To deploy:

```
$ cf push
Using manifest file manifest.yml

Creating cfenv... OK

Creating route cfenv-dfe2f.cfapps.io... OK
Binding cfenv-dfe2f.cfapps.io to cfenv... OK
Uploading cfenv... OK
Starting cfenv... OK
-----> Downloaded app package (64K)
-----> Using Ruby version: ruby-1.9.3
-----> Installing dependencies using Bundler version 1.3.2
       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin --deployment
       Fetching gem metadata from https://rubygems.org/..........
       Fetching gem metadata from https://rubygems.org/..
       Installing json_pure (1.8.0)
       Installing rack (1.5.2)
       Installing rack-protection (1.5.0)
       Installing tilt (1.4.1)
       Installing sinatra (1.4.3)
       Using bundler (1.3.2)
       Your bundle is complete! It was installed into ./vendor/bundle
       Cleaning up the bundler cache.
-----> Uploading droplet (24M)
Checking cfenv...
Staging in progress...
Staging in progress...
Staging in progress...
  1/1 instances: 1 running
OK
$ open http://cfenv-dfe2f.cfapps.io
```

## Env Var API

To view a specific environment variable, you can use the `/v1/:var` endpoint:

```
$ curl http://cfenv-dfe2f.cfapps.io/v1/CF_INSTANCE_PORTS
[{"external":60148,"internal":8080},{"external":60149,"internal":2222}]
```

For envrionment variables that contain JSON data, you can grab
individual values out of them as well (values are re-encoded to JSON):

```
$ curl http://cfenv-dfe2f.cfapps.io/v1/CF_INSTANCE_PORTS/0
{"external":60148,"internal":8080}
$ curl http://cfenv-dfe2f.cfapps.io/v1/CF_INSTANCE_PORTS/0/internal
8080
```
