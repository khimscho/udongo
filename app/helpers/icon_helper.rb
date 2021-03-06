module IconHelper
  def icon(name, label = nil)
    markup = content_tag :i, nil, class: "fa fa-#{name.to_s.tr('_', '-')}"
    label ? "#{markup}&nbsp;#{label}".html_safe : markup
  end
end
