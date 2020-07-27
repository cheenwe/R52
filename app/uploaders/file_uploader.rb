class FileUploader < BaseUploader
  # def filename
  #   if super.present?
  #     # @name ||= SecureRandom.hex(8)
  #     # "file/#{model.id}/#{@name}.#{file.extension.downcase}"

  #     @name ||= SecureRandom.hex(8)
  #     "file/#{Time.now.year}/#{@name}.#{file.extension.downcase}"
  #   en
  # end


  def store_dir
    "uploads/#{model.id}"
  end

end
