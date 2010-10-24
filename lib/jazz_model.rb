module JazzModel
  require "rubygems"
  require "active_support"
  require "active_record"
  require "acts_as_tree"
  require "acts_as_list"
  
  extend ActiveSupport::Autoload
  
  autoload :Base
  autoload :Chord
  autoload :ChordCollection
  autoload :ChordQuality
  autoload :ChordScale
  autoload :ChordSymbol
  autoload :ChordSymbolCollection
  autoload :ChordTone
  autoload :Key
  autoload :KeyContext
  autoload :Mode
  autoload :ModeContext
  autoload :ModeSequence
  autoload :NoteSequence
  autoload :NotesCollection
  autoload :Scale
  autoload :ScaleTone
  autoload :Tone
  autoload :ToneSequence
  autoload :Voicing
  autoload :VoicingTone
  
  autoload :Definition
  
end
