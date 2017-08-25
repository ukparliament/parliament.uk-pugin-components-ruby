require 'spec_helper'
require 'haml'

describe 'pugin/components/_navigation-main.html.haml', type: :view do

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
		allow(view).to receive(:find_your_constituency_path).and_return("/find-your-constituency")
		allow(view).to receive(:house_parties_current_path).and_return("houses/#{Parliament::Utils::Helpers::HousesHelper.commons_id}/parties/current/")
	end

	it 'renders correctly' do
		render
		expect(rendered).to include("<nav aria-label='navigation' class='navigation--main'>")
		expect(rendered).to include('<a href="/mps">MPs</a>')
		expect(rendered).to include('<a href="houses/456/members/current/a-z/a">Lords</a>')
		expect(rendered).to include('<a href="/find-your-constituency">Constituencies</a>')
		expect(rendered).to include('<a href="houses/123/parties/current/">Parties and groups</a>')
	end
end
