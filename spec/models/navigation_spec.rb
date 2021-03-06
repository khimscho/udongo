require 'rails_helper'

describe Navigation do
  let(:model) { described_class }
  let(:klass) { model.to_s.underscore.to_sym }

  it_behaves_like :cacheable

  describe 'validations' do
    describe 'presence' do
      it(:description) { expect(build(klass, description: nil)).not_to be_valid }
    end

    describe 'identifier' do
      it(:presence) { expect(build(klass, identifier: nil)).not_to be_valid }

      it :unique do
        create(klass, identifier: 'foo')
        expect(build(klass, identifier: 'FOO')).not_to be_valid
      end
    end
  end

  it '#respond_to?' do
    expect(build(klass)).to respond_to(:items)
  end
end

