require 'spec_helper'

describe 'Pugin feature module' do
   context 'when attempting to enable a feature that exists' do

        before :each do 
            Pugin::Feature.enable('StatusBanner')
        end

        it 'should successfully enable the feature' do 
            expect(Pugin::Feature::StatusBanner.enabled?).to equal(true) 
        end    
   end

   context 'when attempting to disable a feature that exists' do 
        before :each do 
            Pugin::Feature.disable('StatusBanner')
        end

        it 'should successfully disable the feature' do 
            expect(Pugin::Feature::StatusBanner.enabled?).to equal(false)
        end
   end

   context "when attempting to enable a feature that doesn't exist" do
        it 'should raise an ArgumentError' do 
            expect {Pugin::Feature.enable('NonExistentFeature')}.to raise_error(ArgumentError)
        end
   end
end
