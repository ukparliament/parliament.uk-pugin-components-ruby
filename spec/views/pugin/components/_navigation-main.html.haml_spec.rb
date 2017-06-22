require 'spec_helper'
require 'haml'

describe 'pugin/components/_navigation-main.html.haml', type: :view do

	before :each do 
		HousesHelper = Class.new
      	allow(HousesHelper).to receive(:commons_id).and_return('123')
      	allow(HousesHelper).to receive(:lords_id).and_return('456')
		allow(view).to receive(:mps_path).and_return("/mps")
		allow(view).to receive(:house_members_current_a_z_letter_path).and_return("houses/#{HousesHelper.lords_id}/members/current/a-z/a")
		allow(view).to receive(:constituencies_current_a_z_letter_path).and_return("constituencies/current/a-z/a")
		allow(view).to receive(:house_parties_current_path).and_return("houses/#{HousesHelper.commons_id}/parties/current/")
	end

	it 'renders correctly' do
		render
		expect(rendered).to include("<nav aria-label='navigation' class='navigation--main'>")
		expect(rendered).to include('<a href="/mps">MPs</a>')
		expect(rendered).to include('<a href="houses/456/members/current/a-z/a">Lords</a>')
		expect(rendered).to include('<a href="constituencies/current/a-z/a">Constituencies</a>')
		expect(rendered).to include('<a href="houses/123/parties/current/">Parties and groups</a>')
	end
end
