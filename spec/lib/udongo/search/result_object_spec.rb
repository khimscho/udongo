require 'rails_helper'

describe Udongo::Search::ResultObject do
  let(:klass) { described_class.to_s.underscore.to_sym }
  let(:index) { create(:search_index, searchable_type: 'Foo', searchable_id: 1, value: 'foo') }
  let(:search_context) { Udongo::Search::Base.new('foo') }
  let(:instance) { described_class.new(index, search_context: search_context) }

  it '#build_html' do
    # TODO: Not sure how to test ApplicationController.render calls.
  end

  it '#label' do
    page = create(:page)
    allow(page).to receive(:foo) { 'foobar' }
    index = create(:search_index, searchable: page, name: 'foo', value: 'foobar')
    instance = described_class.new(index, search_context: search_context)

    expect(instance.label).to eq 'foobar'
  end

  it '#locals' do
    allow(index).to receive(:searchable) { 'bar' }
    expect(instance.locals).to eq({ foo: 'bar', index: index })
  end

  it '#partial' do
    expect(instance.partial).to eq 'frontend/search/result_rows/foo'
  end

  it '#partial_target' do
    index = create(:search_index, searchable_type: 'FooBar')
    instance = described_class.new(index)
    expect(instance.partial_target).to eq 'foo_bar'
  end

  it '#responds_to?' do
    expect(instance).to respond_to(
      :build_html, :locals, :partial, :partial_target
    )
  end
end
