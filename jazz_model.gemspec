# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jazz_model/version"

Gem::Specification.new do |s|
  s.name        = "jazz_model"
  s.version     = JazzModel::VERSION
  s.author      = "Ben Hughes"
  s.email       = "ben@railsgarden.com"
  s.homepage    = "http://github.com/rubiety/jazz_model"
  s.summary     = "An object model of jazz theory."
  s.description = "Jazz theory is a mathematical system of concepts and relationships, why not make an ActiveModel representation of those concepts?"
  
  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"]
  s.require_path = "lib"
  
  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
  
  s.add_dependency("activerecord", ["~> 3.1.0"])
  s.add_dependency("activesupport", ["~> 3.1.0"])
  s.add_dependency("acts_as_list", [">= 0.1.2"])
  s.add_dependency("acts_as_tree", [">= 0.1.1"])
  s.add_dependency("sqlite3", ["~> 1.3.0"])
  s.add_development_dependency("rspec", ["~> 2.0"])
end
