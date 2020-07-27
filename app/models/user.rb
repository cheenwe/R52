class User <ApplicationRecord
#   self.abstract_class = true
    #establish_connection("sale_crm".to_sym)
    self.table_name = 'users'

    def valid_password?(pass)
        return true
    end

    def user_signed_in?
    end
end
