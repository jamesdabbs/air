module ApplicationHelper
  def title text
    content_for(:title) { text }
  end

  def flash_class name
    case name
    when :notice
      :success
    when :alert
      :error
    else
      name
    end
  end
end
