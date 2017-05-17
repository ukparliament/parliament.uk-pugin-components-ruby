require 'spec_helper'

describe 'Pugin simple feature' do

    after :example do
        Pugin::Feature::SimpleFeature.disable
    end

    it 'is initially disabled' do 
        expect(Pugin::Feature::SimpleFeature.enabled?).to equal(false)
    end

    context 'without being altered' do 
        it "returns false when checked if it's enabled" do
            expect(Pugin::Feature::SimpleFeature.enabled?).to equal(false)
        end
        it "returns true when checked if it's disabled" do 
            expect(Pugin::Feature::SimpleFeature.disabled?).to equal(true)
        end
    end

    context 'when being enabled' do

        before :each do
            Pugin::Feature::SimpleFeature.enable
        end 

        it "returns true when checked if it's enabled" do
            expect(Pugin::Feature::SimpleFeature.enabled?).to equal(true)
        end
        it "returns false when checked if it's disabled" do 
            expect(Pugin::Feature::SimpleFeature.disabled?).to equal(false)
        end
    end

    context 'when being disabled' do 

        before :each do
            Pugin::Feature::SimpleFeature.disable
        end 

        it "returns false when checked if it's enabled" do
            expect(Pugin::Feature::SimpleFeature.enabled?).to equal(false)
        end
        it "returns true when checked if it's disabled" do 
            expect(Pugin::Feature::SimpleFeature.disabled?).to equal(true)
        end
    end
end