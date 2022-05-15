# README

taken from doorkeeper tutorials and:
https://github.com/doorkeeper-gem/doorkeeper-provider-app
https://www.honeybadger.io/blog/oauth2-ruby/
https://doorkeeper.gitbook.io/guides/grape/grape

oauth provider and resource server with `bundle exec rails s` (server needs postgres db setup)
oauth client and resource consumer with `ruby app.rb`

provider at localhost:3000
client at localhost:4567

Create a user on the server, go to the applications page and create a new application
with a redirect URI: http://localhost:4567/auth/test/callback

Go to the client application, if you're signed in on the server you should be able to
authenticate the client via oauth
