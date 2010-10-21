module JazzModel
  class Base < ActiveRecord::Base
    self.abstract_class = true
    
    establish_connection :adapter => "sqlite3", :database => ":memory:"
    load File.join(File.dirname(__FILE__), "../../db/schema.rb")
    
    def self.load_definitions(definition = :default)
      definition = JazzModel::Definitions.const_get(definition.to_s.camelize) unless definition.is_a?(Class)
      definition.define
    end
  end
end