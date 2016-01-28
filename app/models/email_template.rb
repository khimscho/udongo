class EmailTemplate < ActiveRecord::Base
  include Concerns::Translatable
  translatable_fields :subject, :plain_content, :html_content

  validates :description, :from_name, presence: true
  validates :identifier, presence: true, uniqueness: { case_sensitive: false }
  validates :from_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
