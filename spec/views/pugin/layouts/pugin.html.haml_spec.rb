require 'spec_helper'
require 'haml'

describe 'pugin/layouts/pugin.html.haml', type: :view do
  context 'with a fully implemented person' do
    let(:person) { double('Grom::Node') }

    before :each do
      allow(person).to receive(:name).and_return('Jane Smith')
      allow(person).to receive(:position).and_return('Minister for Tests')
      allow(person).to receive(:id).and_return('123')
      HousesHelper = Class.new
      allow(HousesHelper).to receive(:commons_id).and_return('123')
      allow(HousesHelper).to receive(:lords_id).and_return('456')
      allow(view).to receive(:mps_path).and_return("/mps")
      allow(view).to receive(:house_members_current_a_z_letter_path).and_return("houses/#{HousesHelper.lords_id}/members/current/a-z/a")
      allow(view).to receive(:constituencies_current_a_z_letter_path).and_return("constituencies/current/a-z/a")
      allow(view).to receive(:house_parties_current_path).and_return("houses/#{HousesHelper.commons_id}/parties/current/")
    end

    it 'renders HAML without errors' do
      render
      expect(rendered).to have_title(I18n.t('.pugin.layouts.pugin.website_brand'))
    end
  end
end
