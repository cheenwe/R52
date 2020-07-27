# == Schema Information
#
# Table name: api_v1_properties
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Api::V1::ClientTrack::Category < Api::V1::Property
  has_many :client_tracks, class_name: "Api::V1::ClientTrack"
end
