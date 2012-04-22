$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mwhich/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mwhich"
  s.version     = MWhich::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MWhich."
  s.description = "TODO: Description of MWhich."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependancy "nokogiri", "~> 1.5.2"
  s.add_dependancy "yajl-ruby", "~> 1.1.0"
  s.add_dependancy "ruby-hmac", "~> 0.4.0"

  s.add_development_dependency "sqlite3"
end
