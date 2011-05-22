module JazzModel
  # Extends the Scale.modes association by allowing indexed access to modes. 
  # Whn using it in this manner, key context is passed along.
  # 
  module ModeSequence
    def [](value)
      mode_object = self.find(:first, :conditions => ["name = ? OR mode = ?", value, value])
      return nil if mode_object.nil?
    
      # Pass Along Key Information
      mode_object.key = proxy_owner.key if proxy_owner.respond_to?(:key) and !proxy_owner.key.nil?
      mode_object
    end
  end
end