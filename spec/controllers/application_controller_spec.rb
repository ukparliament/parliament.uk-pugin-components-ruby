require 'rails_helper'

describe ApplicationController do

	describe 'header partial with no data' do
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

    describe 'footer partial with no data' do
        before(:each) do
            get :footer
        end
        it 'has a div selector with the class pds-footer-wrap' do
            expect(response.body).to have_selector('div', class: 'pds-footer-wrap')
        end
        it 'has a div selector with the class pds-footer-row' do
            expect(response.body).to have_selector('div', class: 'pds-footer-row')
        end
        it 'has a div selector with the class pds-footer-copy' do
            expect(response.body).to have_selector('div', class: 'pds-footer-copy')
        end
    end

    describe 'panel partial with no data' do
        before(:each) do
            get :panel
        end
        it 'has a div selector with the class pds-cont-wrap' do
            expect(response.body).to have_selector('div', class: 'pds-cont-wrap')
        end
        it 'has a div selector with the class pds-cont-row' do
            expect(response.body).to have_selector('div', class: 'pds-cont-row')
        end
        it 'has a div selector with the class pds-panel' do
            expect(response.body).to have_selector('div', class: 'pds-panel')
        end
        it 'has a h3 tag' do
            expect(response.body).to have_selector('h3')
        end
        it 'has a p tag' do
            expect(response.body).to have_selector('p')
        end

    end

    describe 'breadcrumb partial with no data' do
        before(:each) do
            get :breadcrumb
        end
        it 'has a div selector with the class pds-cont-wrap' do
            expect(response.body).to have_selector('div', class: 'pds-cont-wrap')
        end
        it 'has a div selector with the class pds-cont-row' do
            expect(response.body).to have_selector('div', class: 'pds-cont-row')
        end
        it 'has a div selector with the class pds-crumb' do
            expect(response.body).to have_selector('div', class: 'pds-crumb')
        end
    end

    describe 'profile card partial with data (object)' do
        before(:each) do
            get :profile_card_data_model
        end
        it 'has a div selector with the class pds-cont-wrap' do
            expect(response.body).to have_selector('div', class: 'pds-cont-wrap')
        end
        it 'has a div selector with the class pds-cont-row' do
            expect(response.body).to have_selector('div', class: 'pds-cont-row')
        end
        it 'has a div selector with the class pds-profcard' do
            expect(response.body).to have_selector('div', class: 'pds-profcard')
        end
        it 'has a div selector with the class pds-profcard-picture' do
            expect(response.body).to have_selector('div', class: 'pds-profcard-picture')
        end
        it 'has a div selector with the class pds-profcard-detail' do
            expect(response.body).to have_selector('div', class: 'pds-profcard-detail')
        end
        it 'has a h2 tag with the text "Steve" in it' do
            expect(response.body).to have_selector('h2', text: 'Steve')
        end
    end

    describe 'profile card partial with data (hashes)' do
        before(:each) do
            get :profile_card_data_hash
        end
        it 'has a div selector with the class pds-cont-wrap' do
            expect(response.body).to have_selector('div', class: 'pds-cont-wrap')
        end
        it 'has a div selector with the class pds-cont-row' do
            expect(response.body).to have_selector('div', class: 'pds-cont-row')
        end
        it 'has a div selector with the class pds-profcard' do
            expect(response.body).to have_selector('div', class: 'pds-profcard')
        end
        it 'has a div selector with the class pds-profcard-picture' do
            expect(response.body).to have_selector('div', class: 'pds-profcard-picture')
        end
        it 'has a div selector with the class pds-profcard-detail' do
            expect(response.body).to have_selector('div', class: 'pds-profcard-detail')
        end
        it 'has a h2 tag with the text "Steve" in it' do
            expect(response.body).to have_selector('h2', text: 'Steve')
        end
    end

    describe 'profile card partial without data' do
        before(:each) do
            get :profile_card_no_data
        end
        it 'has a div selector with the class pds-cont-wrap' do
            expect(response.body).to have_selector('div', class: 'pds-cont-wrap')
        end
        it 'has a div selector with the class pds-cont-row' do
            expect(response.body).to have_selector('div', class: 'pds-cont-row')
        end
        it 'has a div selector with the class pds-profcard' do
            expect(response.body).to have_selector('div', class: 'pds-profcard')
        end
        it 'has a div selector with the class pds-profcard-picture' do
            expect(response.body).to have_selector('div', class: 'pds-profcard-picture')
        end
        it 'has a div selector with the class pds-profcard-detail' do
            expect(response.body).to have_selector('div', class: 'pds-profcard-detail')
        end
        it 'has a h2 tag with the text "Steve" in it' do
            expect(response.body).to have_no_selector('h2')
        end
    end

end
