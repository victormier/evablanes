module ApplicationHelper
  def view_id
    "#{controller.controller_name} #{controller.action_name.downcase}"
  end

  def active_link_to(name, options = {}, html_options = {})
    if html_options.key?(:class)
      html_options.merge!({ :class => html_options[:class] + ' active' }) if current_page?(options)
    else
      html_options.merge!({ :class => 'active' }) if current_page?(options)
    end
    link_to name, options, html_options
  end
end
