module JazzModel
  # Mixins for a sequence of note represented as an array.
  module NoteSequence
    def to_xml(options = {})
      options[:indent] ||= 2
      xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
      xml.instruct! unless options[:skip_instruct]
      xml.notes do
        self.each do |note|
          xml.tag!(:note, note.to_s)
        end
      end
    end
  end
end