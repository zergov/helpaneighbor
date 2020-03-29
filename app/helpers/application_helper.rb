module ApplicationHelper
  def error_message_for(model, field)
    if model.errors.messages[field].any?
      "<div class='input-error-message'>#{model.errors.messages[field].first}</div>".html_safe
    else
      ""
    end
  end
end
