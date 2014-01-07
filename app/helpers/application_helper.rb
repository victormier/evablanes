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

  def locale_url(opts)
    current_locale = I18n.locale

    I18n.with_locale(opts[:i18n_locale].presence || I18n.locale) do
      if has_id && is_show && model = has_model(Project)
        instance = I18n.with_locale(current_locale) do
          model.find_for_show(params[:id])
        end

        opts[:id] = instance.to_param
      end

      url_for(opts)
    end
  end

  def has_id
    params[:id].present?
  end

  def is_show
    params[:action] == 'show'
  end

  def has_model(*models)
    models.detect { |model| model.to_s.tableize == params[:controller] }
  end

  def has_param(param)
    params[param].present?
  end
end
