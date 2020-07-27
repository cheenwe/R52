# == Schema Information
#
# Table name: bz_versions
#
#  id         :integer          not null, primary key
#  file       :string
#  remark     :string
#  version    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tool_id    :integer
#
class Bz::Version < ApplicationRecord
    mount_uploader :file, FileUploader

    before_create :generate_version
    def generate_version
        self.version = Bz::Version.where(tool_id: tool_id).last.version.succ rescue '001'
    end
end
