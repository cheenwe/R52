# == Schema Information
#
# Table name: comments
#
#  id          :bigint           not null, primary key
#  content     :text(65535)
#  record_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#  record_id   :integer
#  user_id     :integer
#
# Indexes
#
#  index_comments_on_record_id_and_record_type  (record_id,record_type)
#  index_comments_on_user_id                    (user_id)
#

class Ldap #< ApplicationRecord

  class << self

    def add_new_user(data)
        Jz::User.create(data)
    end

    # Ldap.auth_login("admin@qq.com", "asdf1234?")
    # session[:user_id]
    def auth_login(name, password)
        ldap = $ladp
        ldap.auth(name, password)
        # p name
        # p password
        # p ldap
        # p ldap.bind

        if ldap.bind
            return true
        else
            return false
        end
    end

    def send_users(user)
        options = {
            name: user.name,
            email: user.phone,
            job: user.remark,
        }
        url = Sy::Config.cfg("ldap_request_url")
        url = URI.parse(url)
        res = Net::HTTP.post_form(url, options)
        p  res.body
    end

    # Ldap.chk_all_user
    def chk_all_user()
        Jz::User.where("remark like :kw or remark like :kw1 ", :kw=>"%销售%", :kw1=>"%售后%").each do |user|
            # p options
            send_users(user)
            # send_users(options)
            # if auth_login(user.name, "asdf1234?")

            #     p user.email
            # end
        end
        return true
    end


    # Ldap.chk_default_password
    def chk_default_password()
        User.all.each do |user|
            if auth_login(user.name, "asdf1234?")
                p user.email
            end
        end
        return true
    end

    # Ldap.find_by_user("admin@qq.com")
    def find_by_user(name)
        Jz::User.where('name = :search OR phone = :search', search: name).try(:last)
    end

    # Ldap.search_all_users
    def search_all_users
        # p $ladp
        # p $ladp
        i = 0
        # filter = Net::LDAP::Filter.eq("cn", "chen*")
        treebase = Sy::Config.cfg("ldap_treebase") 
        # p treebase
        $ladp.search(:base => treebase) do |entry|
            if entry["department"][0]&& entry["mail"][0]
                if find_by_user(entry["mail"][0]).present?
                    p "exists:  #{entry["department"][0]}, #{entry["name"][0]}, #{entry["mail"][0]},#{entry["title"][0]},#{entry["whencreated"][0]}"
                    # find_by_user(entry["name"][0]).update(is_delete:2)
                else
                    tmp = entry["whencreated"][0].to_s
                    whencreated = tmp #"#{tmp[0..3]}-#{tmp[4..5]}-#{tmp[6..7]} "
                    data = {
                        code: entry["department"][0],
                        name: entry["name"][0],
                        phone: entry["mail"][0],
                        remark: entry["title"][0],
                        created_at: whencreated,
                    }

                    add_new_user(data)
                    p data
                end
                i+=1
            end
        end
        return i
    end


    # Ldap.search_one_user("admin@qq.com")
    def search_one_user(name)
        if name.include?("@")
            filter = Net::LDAP::Filter.eq("mail", name)
        else
            filter = Net::LDAP::Filter.eq("name", name)
        end
        attrs = ["department", "name", "mail", "title", "whencreated"]
        treebase = Sy::Config.cfg("ldap_treebase") 
        $ladp.search(:base => treebase, :filter => filter, :attributes => attrs) do |entry|
                @user = find_by_user(entry["name"][0])
                if @user.present?
                    p "exists:  #{entry["department"][0]}, #{entry["name"][0]}, #{entry["mail"][0]},#{entry["title"][0]},#{entry["whencreated"][0]}"
                else
                    tmp = entry["whencreated"][0].to_s
                    whencreated = "#{tmp[0..3]}-#{tmp[4..5]}-#{tmp[6..7]}"
                    data = {
                        department: entry["department"][0],
                        name: entry["name"][0],
                        mail: entry["mail"][0],
                        title: entry["title"][0],
                        whencreated: whencreated,
                    }
                    p data
                    @user = add_new_user(data)
                end

        end
        return @user
    end

  end


end
