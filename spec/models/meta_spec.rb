require 'rails_helper'

describe Meta do
  let(:model) { described_class }
  let(:klass) { model.to_s.underscore.to_sym }

  describe 'validations' do
    describe 'presence' do
      it(:slug) { expect(build(klass, slug: nil)).not_to be_valid }
      it(:locale) { expect(build(klass, locale: nil)).not_to be_valid }
    end
  end

  it '#respond_to?' do
    expect(model.new).to respond_to(
      :sluggable, :seo_title, :seo_keywords, :seo_description, :seo_custom,
      :seo_slug
    )
  end
end

