module ApplicationHelper

  def set_current_tab(tab_name)
    @current_tab = tab_name.to_sym
  end

  def current_tab
    @current_tab
  end

  def nav_tab(name, tab_name, path)
    content_tag(:li, link_to(name, path), {class: current_tab == tab_name ? "active" : ""})
  end
end
