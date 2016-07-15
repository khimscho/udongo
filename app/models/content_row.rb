class ContentRow < ActiveRecord::Base
  include Concerns::Locale

  include Concerns::Sortable
  sortable scope: [:locale, :rowable_type, :rowable_id]

  belongs_to :rowable, polymorphic: true, touch: true
  has_many :columns, class_name: 'ContentColumn', foreign_key: :row_id, dependent: :destroy

  validates :locale, presence: true

  def column_width_calculator
    @column_width_calculator ||= Udongo::ContentRow::ColumnWidthCalculator.new(self)
  end
end
