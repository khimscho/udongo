require 'rails_helper'

describe FormFieldValidation do
  let(:model) { described_class }
  let(:klass) { model.to_s.underscore.to_sym }

  it_behaves_like :sortable

  describe 'validations' do
    describe 'presence' do
      it(:field) { expect(build(klass, field: nil)).not_to be_valid }
      it(:validation_class) { expect(build(klass, validation_class: nil)).not_to be_valid }
    end
  end

  it '#respond_to?' do
    expect(build(klass)).to respond_to(:field)
  end
end
