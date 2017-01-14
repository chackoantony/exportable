# Exportable
Exportable will help you in exporting Rails ActiveRecord models in to different output formats including CSV, XLS etc with just a one liner hook in your model. This Gem is tested against Rails 4 and 5 versions. Support for more output formats will be coming soon.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'exportable'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install exportable
```

## Usage
Just add a one liner hook 'exportable' in your model and your model will be provided 
with class level export methods.

```ruby
class Article < ApplicationRecord
  exportable
end
```

You can then use export methods on the model with supporting formats (:csv, :xls) and field options. 

```ruby
Article.export(:csv)
Article.export(:csv, only: [:title, :user_id])
```
You can also call export methods on model scopes or ActiveRecord::Relation Object.
```ruby
Article.where(staus: 'published').export(:csv)
```

There are also format specific export methods

```ruby
Article.export_csv
Article.export_xls header: false
```

These methods will provide a string in sepcified format which you can write directly to a file or stream through Rails controller.

```ruby
File.open('output.xls', 'wb') {|f| f.write Article.export(:xls) }
```
or in controller
```ruby
send_data Article.export(:csv), filename: 'output.csv
```


Following options are available for hook method and export methods. Please note that options in export methods will always take higher precedence.

###:only

  By default all the fields in model will be exported. You can controll the fields to export using 'only' option.

```ruby
Article.export_csv only: [:title, :published_on, :status]
```

###:except

Omit exportable fields with 'except' option

```ruby
Article.export_csv except: [:status]
```

###:header

By default exporting adds header row. Omit header by option 'header: false'

###:methods

 Exporting not only limited to model attributes. You can also add custom model methods to exportable fields.
```ruby
Article.export methods: [:user_name]
```
Note: *If your model method contains query to association please be carefull to eager load association.*
```ruby
Article.includes(:user).export methods: [:user_name]   
```
## Testing
 This plugin uses Rspec for testing. Go to gem folder and run:
 
 ```bash
 $ rspec
 ```
 

## Contributing
More output formats are always welcome. 

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
