# Pagerage

[![Build Status](https://secure.travis-ci.org/gorsuch/pagerage.png)](http://travis-ci.org/gorsuch/pagerage)

Coming soon!

## Local Development

* assumes you have a local, empty postgres db named 'pagerage'
* assumes you have a pagerduty login and password

```bash
$ export PAGERDUTY_BASE_URL=https://user%40domain.com:password@domain.pagerduty.com/api/v1
$ bundle exec shotgun
$ open http://localhost:9393
```

## Heroku Setup

```bash
$ heroku create
$ heroku addons:add heroku-postgress:crane
$ heroku pg:promote <color>
$ heroku config:add PAGERDUTY_BASE_URL=https://user%40domain.com:password@domain.pagerduty.com/api/v1
$ git push heroku master
```

## Fetching Incidents

We currently only fetch the most recent incidents over the past 24 hours.  Clearly this needs to be optimized, but it is good enough to move forward with.

```bash
$ bundle exec rake fetch
```

The above command will return an integer representing the amount of new incidents.

## Running Tests

Tests are mostly standard RSpec. Run them:

```bash
$ bundle exec rake
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
