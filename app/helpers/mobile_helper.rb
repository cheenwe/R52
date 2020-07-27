#encoding: UTF-8
module MobileHelper


  def mobile_notice_message
    flash_messages = []

    flash.each do |type, message|
      type = :info if type.to_sym == :info
      type = :success if type.to_sym == :notice
      type = :warn if type.to_sym == :alert
      type = :waiting if type.to_sym == :waiting
      # text = content_tag(:div, link_to('x', '#', :class => 'close', 'data-dismiss' => 'alert') + message, class: "alert alert-#{type}")
      s =  "<div class='weui-loadmore weui-loadmore_line'>"
      s<< "  <span class='weui-loadmore__tips'><i class='demos-sub-title weui-icon-#{type} weui-icon_msg '>#{message}</i></span>"
      s<< "</div>"
      text =s

# <i class="weui-icon-success weui-icon_msg"></i>
# <i class="weui-icon-info weui-icon_msg"></i>
# <i class="weui-icon-warn weui-icon_msg-primary"></i>
# <i class="weui-icon-warn weui-icon_msg"></i>
# <i class="weui-icon-waiting weui-icon_msg"></i>

      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end

  def controller?(*controller)
    controller.include?(params[:path])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  # 高亮搜索结果
  def search_result_highlight(hit, field)
    field = field.to_sym
    if highlight = hit.highlight(field)
      raw highlight.format { |word| "<strong class='highlight'>#{word}</strong>" }
    else
      hit.result.send(field)
    end
  end

  def notice_tag(content)
  	content_tag :div, content, class: "alert alert-warning" if content.present?
  end

  def strip_and_truncate(text, em = 60)
    truncate( strip_tags(text).gsub("&nbsp;", "").strip, :length => em ).html_safe
  end

  def no_link
  	"javascript:void(0);"
  end

  def active(self_value, current_value, css = 'active')
    self_value == current_value ? css : ''
  end

  # 高亮搜索结果
  def search_result_highlight(hit, field)
    field = field.to_sym
    if highlight = hit.highlight(field)
      raw highlight.format { |word| "<strong class='highlight'>#{word}</strong>" }
    else
      hit.result.send(field)
    end
  end
end
