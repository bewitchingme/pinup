module ApplicationHelper
  def display_error_for(model, attribute)
    return '' if model.errors[attribute].empty?
    out = ''
    model.errors[attribute].each do |message|
      out << "<li class=\"text-danger\">#{attribute.to_s.humanize} #{message}</li>\n"
    end
    "<ul style=\"list-style-type: none; padding-left: 0;\">\n
      #{out}
    </ul>\n".html_safe
  end
end
