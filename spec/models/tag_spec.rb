require 'rails_helper'

describe Tag do
  let(:model) { described_class }
  let(:klass) { model.to_s.underscore.to_sym }

  it_behaves_like :locale

  describe 'validations' do
    describe 'presence' do
      it(:locale) { expect(build(klass, locale: nil)).not_to be_valid }
      it(:name) { expect(build(klass, name: nil)).not_to be_valid }
      it(:slug) { expect(build(klass, slug: nil)).not_to be_valid }
    end

    it :unique do
      create(klass, slug: 'foo', locale: 'nl')
      expect(build(klass, slug: 'FOO', locale: 'nl')).not_to be_valid
    end
  end

  it '#respond_to?' do
    expect(build(klass)).to respond_to(:tagged_items)
  end
end

