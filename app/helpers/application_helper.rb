module ApplicationHelper
  def display_error_for(model, attribute)
    return '' if model.errors[attribute].empty?
    out = "<ul>\n"
    model.errors[attribute].each do |message|
      out << "<li class=\"text-danger\">#{humanize(attribute)} #{message}</li>\n"
    end
    out << '<\ul>'
    out.html_safe
  end
end
