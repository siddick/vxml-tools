$LOAD_PATH.push( './lib' )
require 'vxml-tools'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'vxml-tools'
  s.version     = VXMLTools::Version
  s.summary     = 'Tools for the VXML implementation.'
  s.description = 'Contain vxml library and Rails generators.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Mohammed Siddick.E'
  s.email             = 'siddick@gmail.com'
  s.homepage          = 'http://siddick.github.com/vxml-tools/'


  package_files = Dir['CHANGELOG', 'MIT-LICENSE', 'README.rdoc', 'lib/**/*', 'config/initializers/mime_types.rb']

  s.files              = package_files
  s.require_path       = 'lib'

#  s.rdoc_options << '--exclude' << '.'
#  s.has_rdoc = false

#  s.add_dependency('rails',         ">= 3.0.0.rc" ) ##{Rails::VERSION::STRING} ")
                   
end
