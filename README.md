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
just add a one liner hook 'exportable' in your model and your model will be provided 
with class level export methods.

class Article < ApplicationRecord
  exportable
end

You can then use export methods with supporting formats (:csv, :xls) and field options 

Article.export(:csv)
Article.export(:csv, only: [:title, :user_id])

You can also call export methods on model scopes or ActiveRecord::Relation Object.

Article.where(staus: 'published').export(:csv)

There are also format specific export methods

Article.export_csv
Article.export_xls header: false


Following options are available for hook method and export methods. Please note that options in export methods will always take higher precedence.

:only

By default export method will export all the fields in the model. You can controll the fields to export using only option.

Article.export_csv only: [:title, :published_on, :status]

:except

Omit exportable fields with :except option

Article.export_csv except: [:status]

:header

By default exporting adds header row. Omit header by option header: false

:methods

Exporting not only limited to model attributes. You can also add custom model methods to exportable fields.

Article.export methods: [:user_name]

Note: If your model method contains query to association please be carefull to eager load association.

Article.includes(:user).export methods: [:user_name]   



## Contributing
More output formats are always welcome. 

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
