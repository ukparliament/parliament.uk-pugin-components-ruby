require 'rails_helper'

describe ApplicationController do

	describe 'header partial' do
		before(:each) do
			get :header
		end

	end

    describe 'test partial' do
        before(:each) do
            get :test
        end

    end

end
