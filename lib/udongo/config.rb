module Udongo
  class Config
    attr_accessor :default_locale, :locales, :prefix_routes_with_locale, :host,
                  :time_zone, :allow_new_tags

    def initialize
      @default_locale = :nl
      @locales = %w(nl en fr de)
      @prefix_routes_with_locale = true
      @host = 'udongo.dev'
      @time_zone = 'Brussels'
      @allow_new_tags = false
    end

    def prefix_routes_with_locale?
      prefix_routes_with_locale === true
    end

    def allow_new_tags?
      allow_new_tags == true
    end
  end
end
