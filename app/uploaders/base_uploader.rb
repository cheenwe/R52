class BaseUploader < CarrierWave::Uploader::Base

  # def store_dir
  #   dir = model.class.to_s.underscore
  #   if Setting.config.upload_provider == "file"
  #     dir = "uploads/#{dir}"
  #   end
  #   dir
  # end

  # def extension_white_list
  #   %w(jpg jpeg gif png svg )
  # end

  private

end
