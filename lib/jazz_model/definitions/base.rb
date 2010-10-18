module JazzModel
  module Definitions
    class Base
      class_inheritable_array :included_definitions
      
      def define
        [included_definitions.uniq - self.class].each do |definition|
          definition.define
        end
      end
      
      def self.use(klass)
        self.included_definitions << klass
      end
    end
  end
end
