require 'spec_helper'
require 'haml'

describe 'pugin/layouts/_layout.html.haml', type: :view do
  before :each do
    module Parliament
      module Utils
        module Helpers
          module HousesHelper
          end
        end
      end
    end
    # Parliament::Utils::Helpers::HousesHelper = Class.new
    allow(Parliament::Utils::Helpers::HousesHelper).to receive(:commons_id).and_return('123')
    allow(Parliament::Utils::Helpers::HousesHelper).to receive(:lords_id).and_return('456')
    allow(view).to receive(:mps_path).and_return("/mps")
    allow(view).to receive(:house_members_current_a_z_letter_path).and_return("houses/#{Parliament::Utils::Helpers::HousesHelper.lords_id}/members/current/a-z/a")
    allow(view).to receive(:constituencies_current_a_z_letter_path).and_return("constituencies/current/a-z/a")
    allow(view).to receive(:house_parties_current_path).and_return("houses/#{Parliament::Utils::Helpers::HousesHelper.commons_id}/parties/current/")
    allow(view).to receive(:find_your_constituency_path).and_return("/find-your-constituency")
    allow(view).to receive(:opensearch_description_url).and_return("http://localhost:3000/search/opensearch")
    allow(view).to receive(:root_path).and_return("/")
    allow(view).to receive(:meta_cookie_policy_path).and_return("/meta/cookie-policy")
  end

  it 'renders HAML without errors' do
    render
    expect(rendered).to have_title(I18n.t('.pugin.layouts.pugin.website_brand'))
  end

  it 'renders the OpenSearch auto discovery link tag' do
    render
    expect(rendered).to include("<link href='http://localhost:3000/search/opensearch' rel='search' title='UK Parliament' type='application/opensearchdescription+xml'>")
  end

  context 'with Pugin.alternates set' do
    let(:alternates) do
      [
        { type: 'text/foo', href: 'https://api.example.com/' },
        { type: 'application/bar', href: 'https://api.example.com/' },
        { type: 'application/bar', href: 'https://api.example.com/test&format=application/bar' },
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

    it 'treats HTML as safe' do
      expect(rendered).to include("<link href='https://api.example.com/test&format=application/bar' rel='alternate' type='application/bar'>")
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
