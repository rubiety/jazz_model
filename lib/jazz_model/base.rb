module JazzModel
  class Base < ActiveRecord::Base
    self.abstract_class = true
    
    establish_connection :adapter => "sqlite3", :database => ":memory:"
    load File.join(File.dirname(__FILE__), "../../db/schema.rb")
    
    def self.load_definitions(definition_name = :default)
      definition = JazzModel::Definition[definition_name]
      raise ArgumentError, "Definition #{definition_name} not found." unless definition
      
      definition.load
    end
  end
end