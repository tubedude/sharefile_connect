# SharefileConnect

This is a simple gem to allow any service to upload files to ShareFile as one single user.
Please refer to [ShareFile Api Documentation](https://api.sharefile.com/rest/docs/resource.aspx?name=Items) for more information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sharefile_connect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sharefile_connect

## Usage

To retrieve a list of all Children Items:
```ruby
sf = SharefileConnect::Data.new
sf.root
# => Returns a String that can be parsed to JSON
```
To retreive an Item (File or Folder) by its path:
```ruby
sf = SharefileConnect::Data.new
sf.items_by_path(["Parent Folder","Folder"])
```
To upload a file to an specific folder:
```ruby
sf = SharefileConnect::Data.new

# Find the id of a folder
folder_id = sf.items_by_path_id(['Folder1', 'Subfolder'])
file_path = '/some_file.pdf'
sf.upload_file(folder_id, file_path)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sharefile_connect.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

