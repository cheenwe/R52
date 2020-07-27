class Track <ApplicationRecord
#   self.abstract_class = true
    #establish_connection("sale_crm".to_sym)
    self.table_name = 'api_v1_client_tracks'
end
