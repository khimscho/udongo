class ContentRowDecorator < ApplicationDecorator
  delegate_all

  # If the max. column count for the biggest screen medium is met, we can safely
  # assume no more additional columns are needed.
  def column_limit_reached?
    column_width_calculator.total(:width_xl) >= 12
  end

  def classes
    list = []
    list << 'no-gutters' if no_gutters?

    if horizontal_alignment.to_s == 'center'
      list << 'justify-content-center'

    elsif horizontal_alignment.to_s == 'right'
      list << 'justify-content-end'
    end

    if vertical_alignment.to_s == 'center'
      list << 'align-items-center'

    elsif vertical_alignment.to_s == 'bottom'
      list << 'align-items-end'
    end

    list
  end

  def styles
    list = {}
    list['background-color'.to_sym] = background_color if background_color.present?

    %w(margin_top margin_bottom padding_top padding_bottom).each do |s|
      str = s.split('_')
      list["#{str.first}-#{str.last}".to_sym] = "#{send(s)}rem" if send(s).present?
    end

    list
  end
end
