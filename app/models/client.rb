class Client <ApplicationRecord
#   self.abstract_class = true
    # #establish_connection("sale_crm".to_sym)
    # self.table_name = 'api_v1_clients'

    belongs_to :product, class_name: "Api::V1::Product", foreign_key: :product_id
    belongs_to :nature, class_name: "Api::V1::Client::Nature", foreign_key: :nature_id
    # belongs_to :developer, class_name: "Api::V1::Client::Nature", foreign_key: :developer_id

end
