# A relationship of one chord to one scale, with some other optional 
# information such as +strength+, representing the strength of the 
# relationships.
# 
# == Associations
# 
# * +chord+ - Associated chord.
# * +mode+ - Associated scale mode.
# * +scale+ - Associated scale through mode. 
# 
# == Key Context
#
# Delegates +key+ to the associated chord to access key context through this relationship.
# 
class ChordScale < ActiveRecord::Base
	belongs_to :chord
	belongs_to :mode
	
	delegate :scale, :to => :mode
	delegate :key, :to => :chord
	
end
