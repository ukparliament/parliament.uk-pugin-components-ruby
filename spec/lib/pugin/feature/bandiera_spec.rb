require 'spec_helper'
require 'pugin/feature/bandiera'

describe 'The bandiera client feature set' do

    method_hash = {
        'show-dissolution': :dissolution?,
        'show-register': :register_to_vote?,
        'show-election': :election?,
        'show-post-election': :post_election?,
        'show-list-images': :show_list_images?,
        'show-committees': :show_committees?,
        'show-government-roles': :show_government_roles?,
        'show-opposition-roles': :show_opposition_roles?
    }

    method_hash.each do |flag_name, method_name|
        context flag_name do
            context 'when the feature exists in Bandiera' do
                before :each do
                    Pugin::Feature::Bandiera.instance_variable_set(:@features, {"#{flag_name}" => true})
                end

                it "returns the value of #{flag_name} in the Bandiera database if it exists" do
                    expect(Pugin::Feature::Bandiera.send(method_name)).to equal(true)
                end
            end
            context 'when the feature does not exist in Bandiera' do
                before :each do
                    Pugin::Feature::Bandiera.instance_variable_set(:@features, {})
                end

                it "returns false because the feature value is nil"  do
                    expect(Pugin::Feature::Bandiera.send(method_name)).to equal(false)
                end
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
