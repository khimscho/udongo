class FormField < ActiveRecord::Base
  include Concerns::Sortable
  sortable scope: [:form_id]

  belongs_to :form
  has_many :validations, class_name: 'FormFieldValidation'

  validates :form, :name, :field_type, presence: true
end
