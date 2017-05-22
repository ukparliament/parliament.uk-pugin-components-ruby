require 'spec_helper'

describe 'Pugin status banner' do

    before :example do 
        Pugin::Feature::StatusBanner.disable
    end

    after :example do
        Pugin::Feature::StatusBanner.disable
    end

    it 'is initially disabled' do 
        expect(Pugin::Feature::StatusBanner.enabled?).to equal(false)
    end

	context 'without being altered' do 
		it "returns false when checked if it's enabled" do
		    expect(Pugin::Feature::StatusBanner.enabled?).to equal(false)
		end
		it "returns true when checked if it's disabled" do 
			expect(Pugin::Feature::StatusBanner.disabled?).to equal(true)
		end
    end

    context 'when being enabled' do

    	before :each do
 		    Pugin::Feature::StatusBanner.enable
    	end 

    	it "returns true when checked if it's enabled" do
    		expect(Pugin::Feature::StatusBanner.enabled?).to equal(true)
    	end
    	it "returns false when checked if it's disabled" do 
    		expect(Pugin::Feature::StatusBanner.disabled?).to equal(false)
    	end
 	end

 	context 'when being disabled' do 

 		before :each do
 		    Pugin::Feature::StatusBanner.disable
    	end 

    	it "returns false when checked if it's enabled" do
    		expect(Pugin::Feature::StatusBanner.enabled?).to equal(false)
    	end
    	it "returns true when checked if it's disabled" do 
    		expect(Pugin::Feature::StatusBanner.disabled?).to equal(true)
    	end
 	end
end