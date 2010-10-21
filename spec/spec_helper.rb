require "rspec"
require "shoulda"
require "active_support"
require "active_model"
require "jazz_model"

RSpec.configure do |config|
  
end

# TODO: Move to context in individual specs, or test in a separate namespace
JazzModel::Definition.load :default
