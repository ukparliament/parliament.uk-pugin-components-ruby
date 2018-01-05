require 'spec_helper'
require 'haml'

describe 'pugin/components/_header.html.haml', type: :view do

	context 'with global_search flag turned on' do
		before :each do
			allow(Pugin::Feature::GlobalSearch).to receive(:enabled?).and_return(true)
		end

		it 'renders as expected' do
        render
        expect(response).to eq(File.read(File.join(Rails.root, '../fixtures', '_header_with_search.html')))
      end
	end

	context 'without global_search flag turned on' do
		it 'renders as expected' do
			render
			expect(response).to eq(File.read(File.join(Rails.root, '../fixtures', '_header.html')))
		end
	end

end
