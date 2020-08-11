class TrainUploader < BaseUploader
  # def filename
  #   if super.present?
  #     # @name ||= SecureRandom.hex(8)
  #     # "file/#{model.id}/#{@name}.#{file.extension.downcase}"

  #     @name ||= SecureRandom.hex(8)
  #     "file/#{Time.now.year}/#{@name}.#{file.extension.downcase}"
  #   en
  # end


  def store_dir
    "data/train/#{model.train.id}/#{model.kind}"
  end

end
