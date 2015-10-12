# -*- encoding: utf-8 -*-
# stub: emk-sinatra-url-for 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "emk-sinatra-url-for"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Eric Kidd"]
  s.date = "2009-04-22"
  s.email = "git@randomhacks.net"
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/emk/sinatra-url-for"
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.rubygems_version = "2.2.2"
  s.summary = "Construct absolute paths and full URLs for a Sinatra application"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.1.1"])
      s.add_development_dependency(%q<rspec>, [">= 1.1.11"])
    else
      s.add_dependency(%q<sinatra>, [">= 0.9.1.1"])
      s.add_dependency(%q<rspec>, [">= 1.1.11"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0.9.1.1"])
    s.add_dependency(%q<rspec>, [">= 1.1.11"])
  end
end
