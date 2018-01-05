require 'spec_helper'
require 'pugin/helpers/controller_helpers'

describe 'pugin/helpers/controller_helpers.rb' do 

	before do 
		class TestClass
			include Pugin::Helpers::ControllerHelpers
		end 
	end

	subject { TestClass.new }

	context '#enable_status_banner' do
		it 'enables the status banner' do 
			subject.enable_status_banner
			expect(Pugin::Feature::StatusBanner.enabled?).to equal(true)
		end
	end
	context '#disable_status_banner' do 

		before :each do 
			Pugin::Feature::StatusBanner.enable
		end

		it 'disables the status banner' do 
			expect(Pugin::Feature::StatusBanner.disabled?).to equal(false)
			subject.disable_status_banner
			expect(Pugin::Feature::StatusBanner.disabled?).to equal(true)
		end
	end
	context '#enable_global_search' do
		it 'enables the global search' do
			subject.enable_global_search
			expect(Pugin::Feature::GlobalSearch.enabled?).to equal(true)
		end
	end
	context '#disable_global_search' do

		before :each do
			Pugin::Feature::GlobalSearch.enable
		end

		it 'disables the global search' do
			expect(Pugin::Feature::GlobalSearch.disabled?).to equal(false)
			subject.disable_global_search
			expect(Pugin::Feature::GlobalSearch.disabled?).to equal(true)
		end
	end
	context '#enable_top_navigation' do 
		it 'enables the top navigation' do 
			subject.enable_top_navigation
			expect(Pugin::Feature::TopNavigation.enabled?).to equal(true)
		end
	end
	context '#disable_top_navigation' do 

		before :each do 
			Pugin::Feature::TopNavigation.enable
		end

		it 'disables the top navigation' do 
			expect(Pugin::Feature::TopNavigation.disabled?).to equal(false)
			subject.disable_top_navigation
			expect(Pugin::Feature::TopNavigation.disabled?).to equal(true)
		end
	end
	context '#reset_bandiera_features' do 
		before :each do
			Pugin::Feature::Bandiera.instance_variable_set(:@features, {'show-register' => true, 'show-dissolution' => true})
		end

		it 'resets @features back to nil' do
			subject.reset_bandiera_features
			expect(Pugin::Feature::Bandiera.instance_variable_get(:@features)).to equal(nil)
		end
	end
end
