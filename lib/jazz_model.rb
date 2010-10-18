module JazzToolbox
  extend ActiveSupport::Autoload
  
  autoload_under "jazz_model" do
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
  end
end
