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

  context 'renders OpenGraph tags' do
    before :each do
      render
    end

    it 'renders og:title' do
      expect(rendered).to include("<meta content='UK Parliament' property='og:title'>")
    end
    it 'renders og:type' do
      expect(rendered).to include("<meta content='website' property='og:type'>")
    end
    it 'renders og:url' do
      expect(rendered).to include("property='og:url'")
    end

    context 'correctly on person' do
      let(:member) { Class.new }

      before :each do
        allow(member).to receive(:image_id).and_return('1234')
        @person = member
        render
      end

      it 'renders og:image' do
        expect(response).to include("<meta content='https://api.parliament.uk/photo/1234.jpeg?crop=CU_1:1&width=400&quality=100' property='og:image'>")
        expect(response).to include("<meta content='400' property='og:image:width'>")
        expect(response).to include("<meta content='400' property='og:image:height'>")
        expect(response).to include("<meta content='summary' name='twitter:card'>")
      end
    end

    context 'correctly on media' do
      let(:media) { Class.new }

      before :each do
        allow(media).to receive(:graph_id).and_return('5678')
        @image = media
        render
      end

      it 'renders og:image' do
        expect(response).to include("<meta content='https://api.parliament.uk/photo/5678.jpeg?crop=CU_1:1&width=400&quality=100' property='og:image'>")
        expect(response).to include("<meta content='400' property='og:image:width'>")
        expect(response).to include("<meta content='400' property='og:image:height'>")
        expect(response).to include("<meta content='summary' name='twitter:card'>")
      end
    end

    context 'correctly on other pages' do
      it 'renders og:image' do
        expect(rendered).to include("<meta content='#{Pugin::STATIC_ASSET_PUBLIC_LOCATION_URL}/opengraph-oblong.png' property='og:image'>")
        expect(response).to include("<meta content='1200' property='og:image:width'>")
        expect(response).to include("<meta content='630' property='og:image:height'>")
        expect(response).to include("<meta content='summary_large_image' name='twitter:card'>")
      end
    end
  end

  describe 'ApplictaionInsights' do
    context 'with request ID set' do
      before :each do
        assign(:app_insights_request_id, '|12345678abcdefgh.')
        render
      end

      it 'render the expected meta tag' do
        expect(rendered).to include("<meta content='|12345678abcdefgh.' name='applicationinsights-request-id'>")
      end
    end

    context 'without request ID set' do
      before :each do
        render
      end

      it 'does not render the meta tag' do
        expect(rendered).not_to include('name="applicationinsights-request-id"')
      end
    end
  end
end
