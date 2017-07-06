require 'spec_helper'
require 'haml'

describe 'pugin/layouts/_layout.html.haml', type: :view do
  before :each do
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

  context 'with Pugin.alternates set' do
    let(:alternates) do
      [
        { type: 'text/foo', href: 'https://api.example.com/' },
        { type: 'application/bar', href: 'https://api.example.com/' },
      ]
    end

    before :each do
      allow(Pugin).to receive(:alternates).and_return(alternates)
      render
    end

    it 'renders rel-alternate links' do
      expect(rendered).to include('<link href=\'https://api.example.com/\' rel=\'alternate\' type=\'text/foo\'>')
      expect(rendered).to include('<link href=\'https://api.example.com/\' rel=\'alternate\' type=\'application/bar\'>')
    end
  end

  context 'without Pugin.alternates set' do
    before :each do
      allow(Pugin).to receive(:alternates).and_return([])
      render
    end

    it 'renders rel-alternate links' do
      expect(rendered).not_to include('<link href=\'https://api.example.com/\' rel=\'alternate\' type=\'text/foo\'>')
      expect(rendered).not_to include('<link href=\'https://api.example.com/\' rel=\'alternate\' type=\'application/bar\'>')
    end
  end
end
