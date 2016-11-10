require 'rails_helper'

describe ApplicationController do

	describe 'header partial' do
		before(:each) do
			get :header
		end
        it 'has a div selector with the class pds-header-wrap' do
            expect(response.body).to have_selector('div', class: 'pds-header-wrap')
        end
        it 'has a div selector with the class pds-header-row' do
            expect(response.body).to have_selector('div', class: 'pds-header-row')
        end
        it 'has a div selector with the class pds-header-logo' do
            expect(response.body).to have_selector('div', class: 'pds-header-logo')
        end
	end

end
