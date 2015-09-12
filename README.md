# rdb2spreadsheet

This is a gem library to transfer data from rdb to spreadsheet at google drive.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rdb2spreadsheet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rdb2spreadsheet

## Usage

```
# rdb connection settings
rdb_configs = {
  "adapter"=>"mysql2",
  "encoding"=>"utf8",
  "host"=>"127.0.0.1",
  "username"=>"root",
  "password"=>nil,
  "database"=>"shop",
  "cast"=>false
}

# google spreadsheet settings
spreadsheet_configs = {
  'client_id' => 'xxxxxxxx',
  'client_secret' => 'xxxxxxxxxx',
  'refresh_token' => 'xxxxxxxxxx'
}

# sql statements (example)
sqls = {
  'under500' => '
    select * from books where price < 500 limit 100
  ',
  '500to1000' => '
    select * from books where price between 500 and 1000 limit 100
  ',
  'over1000' => '
    select * from books where price > 10000 limit 100
  '
}

# spreadsheet hash-key
book_key = 'xxxxxxxxxxxxxxxxxxx'

updater = Rdb2spreadsheet.new(rdb_configs, spreadsheet_configs)
updater.import_all(book_key, sqls)

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec rdb2spreadsheet` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rdb2spreadsheet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
