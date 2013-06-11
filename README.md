# Display CF environment variables

<img src="https://raw.github.com/cloudfoundry-community/cf-env/master/docs/images/demo.png" />

A simple sinatra application, once deployed to Cloud Foundry, will echo the Environment and HTTP Request Headers.

Especially useful to learn about service connection details (`$VCAP_SERVICES`) being passed to an application. Create them, and bind them to this running application, and you'll see the nested JSON string that is set in `$VCAP_SERVICES`.

For an example deployment of this application see:
http://sv-env.cloudfoundry.com

## Deploy

To deploy:

```
$ cf push
Using manifest file manifest.yml

Custom startup command> none

Creating env... OK

1: env
2: none
Subdomain> env

1: mypaas.com
2: none
Domain> mypaas.com

Binding env.mypaas.com to hello... OK
Uploading hello... OK
Starting hello... OK
-----> Downloaded app package (4.0K)
Installing ruby.
-----> Using Ruby version: ruby-1.9.2
-----> Installing dependencies using Bundler version 1.3.2
       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin --deployment
       Fetching gem metadata from https://rubygems.org/..........
       Installing rack (1.5.2)
       Using bundler (1.3.2)
       Your bundle is complete! It was installed into ./vendor/bundle
       Cleaning up the bundler cache.
-----> Uploading staged droplet (24M)
-----> Uploaded droplet
Checking hello...
Staging in progress...
  0/1 instances: 1 starting
  0/1 instances: 1 starting
  1/1 instances: 1 running
OK

$ open http://env.mypaas.com
```
