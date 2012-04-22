$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mwhich/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mwhich"
  s.version     = MWhich::VERSION
  s.authors     = ["dacort", "connormontgomery", "jmooserific"]
  s.homepage    = "http://github.com/connormontgomery/mwhich"
  s.summary     = "Because searching Netflix, Amazon, Hulu, and iTunes sucks rocks."
  s.description = "MWhich was created because I'm lazy, and that laziness led to a loss of money. Many times I end up watching on movie on iTunes simply because it is the first place I look, even though had I taken another minute I would have found the same movie available via Netflix Instant Play, or cheaper on Amazon's Video on Demand service."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "nokogiri"
  s.add_dependency "yajl-ruby"
  s.add_dependency "ruby-hmac"

  s.add_development_dependency "sqlite3"
end
