$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "exportable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'exportabe'
  s.version     = Exportable::VERSION
  s.authors     = ['Sunil Antony']
  s.email       = ['chackoantonydaniel@gmail.com']
  s.homepage    = 'https://github.com/chackoantony/exportable'
  s.summary     = "Exporting Rails ActiveRecord models."
  s.description = 'Exportable will help you in exporting ActiveRecord models in to different output formats including CSV, XLS etc.'
  s.license     = "MIT"
  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.test_files = Dir["spec/**/*"]
  s.add_dependency 'activerecord', ['>= 4.0']
  s.add_dependency 'spreadsheet'
  s.add_development_dependency 'rails', ['>= 4.0']
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'database_cleaner'
end
