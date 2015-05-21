require 'rails_helper'

describe Page do
  let(:model) { described_class }
  let(:klass) { model.to_s.underscore.to_sym }

  it_behaves_like :translatable
  it_behaves_like :taggable
  it_behaves_like :loggable
  it_behaves_like :cacheable
  it_behaves_like :parentable
  it_behaves_like :visible
  it_behaves_like :seo
  it_behaves_like :trashable
  it_behaves_like :deletable
  it_behaves_like :sortable
  it_behaves_like :draggable

  describe 'validations' do
    describe 'presence' do
      it(:description) { expect(build(klass, description: nil)).to_not be_valid }
    end

    describe 'identifier' do
      it :unique do
        create(klass, identifier: 'foo')
        expect(build(klass, identifier: 'FOO')).to_not be_valid
      end
    end
  end
end
