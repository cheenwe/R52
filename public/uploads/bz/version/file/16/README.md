# README

## Info

基础模块系统, 支持账户管理 权限 系统设置等


### CODING STYLE

The following points are not necessarily set in stone but should rather be used
as a good guideline.  Consistency is the goal of coding style, and changes will
be more easily accepted if they are consistent with the rest of the code.

* **File Encoding**
  * UTF-8
* **Indentation**
  * Two spaces; no tabs
* **Line length**
  * Limit lines to a maximum of 80 characters
* **Comments**
  * Document classes, attributes, methods, and code
* **Method Calls with Arguments**
  * Use `a_method(arg, arg, etc)`; **not** `a_method( arg, arg, etc )`,
    `a_method arg, arg, etc`, or any other variation
* **Method Calls without Arguments**
  * Use `a_method`; avoid parenthesis
* **String Literals**
  * Use single quotes by default
  * Use double quotes when interpolation is necessary
  * Use `%{...}` and similar when embedding the quoting character is cumbersome
* **Blocks**
  * `do ... end` for multi-line blocks and `{ ... }` for single-line blocks
* **Boolean Operators**
  * Use `&&` and `||` for boolean tests; avoid `and` and `or`
* **In General**
  * Try to follow the flow and style of the rest of the code



## 基础功能开发

1. 通过接口返回省市县数据: api/v1/provinces or /cities/areas/streets/villages
2. 通过接口在服务器执行命令并返回结果: /api/v1/test_command?c=df -h


## 开发

yarn



## dev

label， name, 默认值， 是否必填

- input
              <%= input_text_tag("产品名称", "product[name]", "default_value", true ) %>
- date
              input_date_tag

- textarea
              <%= input_textarea_tag("备注", "product[remark]", "default_value", true ) %>


            <div class="form-group">
                <label class="form-label">
                    备注
                    <span class="form-required">*</span>
                </label>
                <textarea id="product_remark" class="form-control" required="required"   data-parsley-trigger="keyup"   data-parsley-maxlength="12" remark="product[remark]" > </textarea>
            </div>

- select
                <!-- label名, 字段名, 数据, [字段id,值, 是否必填(可选), 创建连接(可选)]  -->

                <% id = @projects_item.category_id rescue ''%>
                <% name = @projects_item.category.name rescue ''%>

                <%= input_select_tag("#{t :'projects_item.category_id'}", "projects_item[category_id]", Property::ItemCategory.all,   [id, name, true, "/properties/list?names=#{t :'projects_item.category_id'}&type=Property::ItemCategory" ] )%>

- 缩略显示

                <%= show_more_dialog(t(:"projects_order.content"), @projects_order.content) %>


<form id="new_reply" style="float:right" action="/wp/items/next_step/<%= item.id%>" accept-charset="UTF-8" data-remote="true" method="post">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
  <input type="hidden" name="id" value="<%= params[:id] %>">
  <input type="hidden" name="status" value="1">
  <input type="hidden" name="record_type" value="<%= @projects_order.class.name %>">
  <input type="hidden" name="record_id" value="<%= params[:id] %>">
  <input type="hidden" name="reply[reply_to_id]" id="reply_reply_to_id">
  <input type="hidden" name="user_id" value="<%= next_step.user_id %>">
  <input type="hidden" name="record_user_id" value="<%= item.user_id %>">
  <input type="hidden" name="user_record_id" value="<%= next_step.record_id %>">
  <button type="submit" class="btn btn-secondary btn-sm" data-disable-with="提交">指派给: <%= next_step.username %></button>&nbsp;
</form>
