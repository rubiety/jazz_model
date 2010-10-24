module JazzModel
  class Definition
    cattr_accessor :definitions
    @@definitions = []
    
    attr_reader :name
    attr_reader :definition
    attr_reader :included_definitions
    
    def initialize(name = nil, &block)
      if name.is_a?(Hash)
        raise ArgumentError, "Only one hash key expected" if name.keys.size > 1
        @name = name.keys[0]
        @included_definitions = name.values[0].is_a?(Array) ? name.values[0].map(&:to_sym) : [name.values[0].to_sym]
      else
        @name = name
        @included_definitions = []
      end
      
      @definition = block
      @loaded = false
      
      @@definitions << self
    end
    
    def loaded?
      !!@loaded
    end
    
    def self.[](name)
      definitions.find {|d| d.name.to_s == name.to_s }
    end
    
    def self.define(name, &block)
      definition = self.new(name, &block)
    end
    
    def self.load(name)
      if definition = self[name]
        definition.load
      else
        raise ArgumentError, "No definition known '#{name}'."
      end
    end
    
    def ensure_loaded
      load unless loaded?
    end
    
    def load
      (all_included_definitions.uniq - [self]).each do |d|
        self.class[d].ensure_loaded
      end
      
      instance_eval(&@definition)
      
      @loaded = true
    end
    
    def all_included_definitions
      (@included_definitions.map {|d| self.class[d].try(:all_included_definitions) } + @included_definitions).flatten.compact.uniq
    end
  end
end

Dir[File.join(File.dirname(__FILE__), "definitions", "*.rb")].each {|f| require f}