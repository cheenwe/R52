module TrashBase
  extend ActiveSupport::Concern

  included do
    before_destroy :move_to_trash
  end

  def move_to_trash
    class_name = self.class.name.constantize
    puts class_name
    content = {}
    class_name.attribute_names.each do |attr_name|
      eval "content[:#{attr_name}] = self.#{attr_name}"
    end
  	Trash.create(name: class_name.to_s, oid: self.id, user_id: (User.current_user.id rescue 0), detail: content ) #,user_id: current_user.id rescue 0
  end
end