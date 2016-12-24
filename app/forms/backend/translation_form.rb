class Backend::TranslationForm < Udongo::Form
  attr_reader :model, :translation

  # attribute :subject, String
  # attribute :plain_content, String
  # attribute :html_content, String
  #
  # validates :subject, :plain_content, :html_content, presence: true

  delegate :id, to: :model

  def initialize(model, translation)
    @model = model
    @translation = translation

    init_attribute_values(@translation)
  end

  # def self.model_name
  #   EmailTemplate.model_name
  # end

  def persisted?
    true
  end

  private

  def save_object
    init_object_values(@translation)
    @model.save
  end
end