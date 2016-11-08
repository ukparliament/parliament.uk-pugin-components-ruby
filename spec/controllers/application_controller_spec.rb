require 'rails_helper'

describe ApplicationController do
	
	describe 'header template' do
		before(:each) do
			get :header
		end
		it 'has a div selector with the class ukpds-header' do
			expect(response.body).to have_selector('div', class: 'ukpds-header')
		end
		it 'contains the logo image with the class site-logo' do
			expect(response.body).to have_selector('img', class: 'site-logo')
		end
	end

	describe 'footer template' do
		before(:each) do
			get :footer
		end
		it 'has a div selector with the class ukpds-footer' do
			expect(response.body).to have_selector('div', class: 'ukpds-footer')
		end
		it 'has a p tag with the text Parliamentary Copyright and class meta-copyright' do
			expect(response.body).to have_selector('p', text: 'Parliamentary Copyright', class: 'meta-copyright')
		end
		it 'contains the portcullis footer image with the class footer-portcullis' do
			expect(response.body).to have_selector('img', class: 'footer-portcullis')
		end
	end

	describe 'member_card template' do
		before(:each) do
			get :members_card
		end
		it 'has a div selector with the class ukpds-members-card' do
			expect(response.body).to have_selector('div', class: 'ukpds-members-card')
		end
		it 'contains the member image with the class card__profile' do
			expect(response.body).to have_selector('img', class: 'card__profile')
		end
		it 'has an h4 selector with the text Khaleesi Mother of Dragons' do
			expect(response.body).to have_selector('h4', class: 'card__title', text: 'Khaleesi Mother of Dragons')
		end
	end
end