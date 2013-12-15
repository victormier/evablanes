module Admin::ApplicationHelper
  def activable_link_to(name, options = {}, html_options = {})
    if html_options.key?(:class)
      html_options.merge!({ :class => html_options[:class] + ' active' }) if current_page?(options)
    else
      html_options.merge!({ :class => 'active' }) if current_page?(options)
    end
    link_to name, options, html_options
  end

  def current_page?(page)
    path = request.env['PATH_INFO']

    page_root = /(\/admin\/[^\/]+)\/?.*/.match(page).try(:[], 1)
    path_root = /(\/admin\/[^\/]+)\/?.*/.match(path).try(:[], 1)

    page_root == path_root
  end

  def navigation_item_for(*path)
    classes = []
    classes << "active" if path.include?(request.path)

    content_tag(:li, :class => classes) do
      yield
    end
  end
end