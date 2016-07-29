require 'rails_helper'

describe Udongo::Configs::I18n do
  let(:klass) { described_class }

  describe 'defaults' do
    it :default_locale do
      expect(klass.new.default_locale).to eq 'nl'
    end

    it :locales do
      expect(klass.new.locales).to eq %w(nl en fr de)
    end
  end

  it '#respond_to?' do
    expect(klass.new).to respond_to(
      :default_locale, :default_locale=, :locales, :locales=
    )
  end
end