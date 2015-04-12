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

   def bootstrap_class_for flash_type
    { success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end 

    def focus_on(xpath_query)
    insert_javascript "$('#{xpath_query}').focus();"
  end

    def insert_javascript(javascript)
    content_for(:javascript_insert) do
      (<<-HERE).html_safe
        <script>
          $(document).ready(function() {
            #{javascript}
          });
        </script>
      HERE
    end
  end
  
end
