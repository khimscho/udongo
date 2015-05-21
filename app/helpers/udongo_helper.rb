module UdongoHelper
  # Before using: Put <%= yield(:javascripts) %> in the <head> of your app's frontend
  def javascript(file, order = :late)
    target = :javascripts
    target = "javascripts_#{order}".to_sym if [:early, :head].include?(order.to_sym)
    content_for(target) { javascript_include_tag(file) } unless content_for?(target)
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  # Before using: Put <%= yield(:stylesheets) %> in the <head> of your app's frontend
  def stylesheet(file, media = :screen)
    content_for(:stylesheets) { stylesheet_link_tag(file, media: media) }
  end
end