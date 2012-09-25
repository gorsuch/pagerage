![Pagerage](https://raw.github.com/gorsuch/pagerage/master/pagerage.jpg)

# Pagerage

[![Build Status](https://secure.travis-ci.org/gorsuch/pagerage.png)](http://travis-ci.org/gorsuch/pagerage)

Coming soon!

## Configuration

```bash
export PAGERDUTY_BASE_URL=https://user%40domain.com:password@domain.pagerduty.com/api/v1
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
