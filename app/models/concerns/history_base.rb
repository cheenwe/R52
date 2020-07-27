module HistoryBase
  extend ActiveSupport::Concern

  included do
    has_many :histories, as: :historyable
    after_create :generate_create_history
    after_update :generate_update_history
  end

  def generate_create_history
    class_name = self.class.name.constantize
    model_name = I18n.t("#{class_name.model_name.element}.formname")
    name = self.name rescue nil || self.username rescue nil || self.number rescue nil || self.content rescue nil
    self.histories.create(detail: "创建了#{model_name} #{value_to_human(name,name)}", user_id: (User.current_user.id rescue 1), operation: "create")
  end

  def generate_update_history
    class_name = self.class.name.constantize
    model_name = I18n.t("#{class_name.model_name.element}.formname")

    unless self.try(:current_sign_in_at_changed?) #获取current user的方法与用户登陆时执行after update方法会有冲突，所以做个判断
      attributes_changes = self.changes    #获取更新的字段
      ["updated_at", "password","remember_created_at", "encrypted_password"].each { |a| attributes_changes.delete(a) }
      if attributes_changes != {}
        attr = ["修改了#{model_name}"]
        attributes_changes.each_with_index do |(key, value), index|
          association = {}
          self.class.reflect_on_all_associations(:belongs_to).each do |x|
            association = association.merge({x.foreign_key =>x.class_name}) #获取关联对象的model name
          end

          association_model_name = []
          if association["#{key}"]
            association_model = association["#{key}"].constantize
            value.each do |x|
              # name =  association_model.find(x).username rescue "空" || association_model.find(x).name rescue "空" || association_model.find(x).code rescue "空"
              # puts "---------______#{association_model}______#{x}________________-----"
              if x.to_i >1&&association_model.where(id: x).present? && (association_model.column_names.include? "username")
                name = association_model.find(x).username rescue "空"
              elsif  x.to_i >1&&association_model.where(id: x).present? && (association_model.column_names.include? "code")
                name = association_model.find(x).code rescue "空"
              elsif  x.to_i >1&&association_model.where(id: x).present? &&  (association_model.column_names.include? "name"||"code")
                name = association_model.find(x).name rescue "空"
              else
                name= "空"
              end
              association_model_name << value_to_human(key, name)
            end
            attr.push I18n.t("#{class_name.model_name.element}.#{key}")+"从 #{association_model_name[0]} 修改为 #{association_model_name[1]}"
          else
            # puts "----3333333333333-----______#{key}______#{value[0]}______#{value[1]}__________-----"
            attr.push I18n.t("#{class_name.model_name.element}.#{key}")+"从 #{value_to_human(key, value[0])} 修改为 #{value_to_human(key, value[1])}"
          end if value
        end
        details = attr.join("--- !ruby")
        self.histories.create(detail: details, user_id: (User.current_user.id rescue 1), operation: "update")
      end
    end
  end

  private
  def value_to_human(key, val)
    if val.class == TrueClass || val.class == FalseClass
      if key == "sex"
        val === true ? val = "男" : val = "女"
      else
        val === true ? val = "是" : val = "否"
      end
    elsif key == ("saler_id"||"user_id")
      # puts "++++++#{key}+++++#{val}++++++#{val.class}++++++++"
      val = User.find(val).username rescue "空"
    else

    end
    val = "<span class='blue'>#{val}</span>"
  end
end