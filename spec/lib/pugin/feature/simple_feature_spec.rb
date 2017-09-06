require 'spec_helper'

describe 'Pugin simple feature' do

    before :example do 
        Pugin::Feature::SimpleFeature.disable
    end

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

    context 'when enabling a subclass' do
      it 'only enables that sub class' do
        expect(Pugin::Feature::SimpleFeature.enabled?).to equal(false)

        Pugin::Feature::TopNavigation.enable
        expect(Pugin::Feature::TopNavigation.enabled?).to equal(true)
        expect(Pugin::Feature::SimpleFeature.enabled?).to equal(false)

        Pugin::Feature::TopNavigation.disable
        expect(Pugin::Feature::TopNavigation.enabled?).to equal(false)

        Pugin::Feature::SimpleFeature.enable
        expect(Pugin::Feature::TopNavigation.enabled?).to equal(false)
        expect(Pugin::Feature::SimpleFeature.enabled?).to equal(true)

        Pugin::Feature::TopNavigation.enable
        Pugin::Feature::SimpleFeature.disable
        expect(Pugin::Feature::TopNavigation.enabled?).to equal(true)
        expect(Pugin::Feature::SimpleFeature.enabled?).to equal(false)
      end
    end
end
