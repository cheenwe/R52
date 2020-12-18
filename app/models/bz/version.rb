# == Schema Information
#
# Table name: bz_versions
#
#  id         :bigint           not null, primary key
#  file       :string(255)
#  remark     :text(65535)
#  version    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tool_id    :integer
#
class Bz::Version < ApplicationRecord
    # mount_uploader :file, FileUploader

    serialize :remark
    before_create :generate_version
    def generate_version
        self.version = Bz::Version.where(tool_id: tool_id).last.version.succ rescue '001'
    end
end
