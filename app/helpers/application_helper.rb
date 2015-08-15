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
  
    def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
