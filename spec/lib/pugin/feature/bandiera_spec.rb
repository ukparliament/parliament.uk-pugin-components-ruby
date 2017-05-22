require 'spec_helper'
require 'pugin/feature/bandiera'

describe 'The bandiera client' do

    context 'when checking if Parliament is in dissolution' do 
        context 'when the feature exists in Bandiera' do

            before :each do
                Pugin::Feature::Bandiera.instance_variable_set(:@features, {'show-dissolution' => true})
            end

            it "returns the value of show-dissolution in the Bandiera database if it exists"  do 
                expect(Pugin::Feature::Bandiera.dissolution?).to equal(true)
            end
        end

        context 'when the feature does not exist in Bandiera' do 

            before :each do
                Pugin::Feature::Bandiera.instance_variable_set(:@features, {})
            end

            it "returns false because the feature value is nil"  do 
                expect(Pugin::Feature::Bandiera.dissolution?).to equal(false)
            end
        end
    end

    context 'when checking if you can still register to vote' do 
        context 'when the feature exists in Bandiera' do 

            before :each do
                Pugin::Feature::Bandiera.instance_variable_set(:@features, {'show-register' => true})
            end

            it "returns the value of show-dissolution in the Bandiera database if it exists"  do 
                expect(Pugin::Feature::Bandiera.register_to_vote?).to equal(true)
            end
        end

        context 'when the feature does not exist in Bandiera' do 

            before :each do
                Pugin::Feature::Bandiera.instance_variable_set(:@features, {})
            end

            it "returns false because the feature value is nil"  do 
                expect(Pugin::Feature::Bandiera.register_to_vote?).to equal(false)
            end
        end
    end

    context 'when trying to reset the @features instance variable' do

        before :each do
            Pugin::Feature::Bandiera.instance_variable_set(:@features, {'show-register' => true})
        end

        it 'resets the @features instance variable back to nil' do
            Pugin::Feature::Bandiera.reset
            expect(@features).to equal(nil)
        end
    end
end