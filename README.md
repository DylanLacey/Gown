# Gown

Sauce Connect's verbose logs are big and hard to read.  Replace all those puffy KGP lines, bulky CMDs and tightly cinched MAINs with a breezy gown!

## Installation

Gown is intended to be installed as a standalone tool:

    $ gem install gown

But, you can use it in the normal way by adding it to your Gemfile.  If you want to do this, you should probably already know how ;)

## Usage

### Default Operation
Gown takes one required argument, `file_to_strip`:

`   $ gown original_filename.log`

By default, it will write the stripped log to `original_filename.log.stripped`.  To write to a desired file, pass a second argument:

`   $ gown original_filename.log new_filename.log`

### Custom Filtering
The patterns for filtering are defined in `gown/lib/gown/patterns.rb`.  They're added to the pattern collection in `gown/gown.rb`.

The ability to edit these is coming.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gown. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License & Support

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

Additionally, this gem is subject to the following support guarantee:  None.  Neither the author, contributors, nor Sauce Labs warrant this gem's fitness for any purpose, nor is any support of any kind promised.  Seriously, don't lodge tickets with Sauce Labs.  This isn't even an official offering of theirs.

## Code of Conduct

Everyone interacting in the Gown project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/gown/blob/master/CODE_OF_CONDUCT.md).
