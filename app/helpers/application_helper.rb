module ApplicationHelper
  FLASHMAP = {
    :notice => "success",
    :error => "error",
    :alert => "warning"
  }

  def render_flash
    message = flash[:notice] || flash[:error] || flash[:alert]
    key = FLASHMAP[flash.keys[0]]
    if message
      content_tag(:div, :class => "alert-message #{key}") do
        link_to("x", "#", :class => "close") + content_tag(:p, message)
      end
    end
  end

  def render_tab(name, url)
    css_class = @tab == name ? "active" : ""
    content_tag(:li, :class => css_class) do
      link_to(name, url)
    end
  end
end
