require 'spec_helper'
require 'haml'

describe 'pugin/layouts/pugin.html.haml', type: :view do
  context 'with a fully implemented person' do
    let(:person) { double('Grom::Node') }

    before :each do
      allow(person).to receive(:name).and_return('Jane Smith')
      allow(person).to receive(:position).and_return('Minister for Tests')
      allow(person).to receive(:id).and_return('123')
    end

    it 'renders HAML without errors' do
      render
      expect(rendered).to have_title(I18n.t('website_brand'))
    end
  end
end
