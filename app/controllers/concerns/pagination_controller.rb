require 'will_paginate/array'

module Concerns
  module PaginationController
    extend ActiveSupport::Concern

    included do
      # The respond_to? is added because of issues in our specs.
      if respond_to?(:helper_method)
        helper_method :per_page, :page_number
      end
    end

    def page_number
      return 1 unless params[:page].respond_to?(:to_i)
      page = params[:page].to_i.abs
      page == 0 ? 1 : page
    end

    def paginate(records, options = {})
      options.reverse_merge!(page: page_number, per_page: per_page)

      if records.is_a?(Array)
        records.paginate options
      else
        records.page(options[:page]).per_page(options[:per_page])
      end
    end

    def per_page
      [5, 10, 25, 30, 50, 100].each do |i|
        return i if params[:per_page].to_i == i
      end

      10
    end
  end
end
