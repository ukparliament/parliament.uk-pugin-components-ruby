require 'spec_helper'
require 'haml'

describe 'pugin/components/_status.html.haml', type: :view do

  it 'renders an ordered list when :ordered? is set to true' do 
    render partial: 'pugin/elements/list', locals: { ordered?: true, data: {} }
    expect(response).to include('<ol class="list--block">')
  end

  it 'renders an unordered list when :ordered? is not set' do 
    render partial: 'pugin/elements/list', locals: { data: {} }
    expect(response).to include('<ul class="list--block">')
  end

  context 'without any data' do 
    it 'renders a no content message when there is no data' do 
      render partial: 'pugin/elements/list', locals: { data: {} }
      expect(response).to include("There are no results")
    end
  end

  context 'with data' do 

    before :each do
      constituency = Class.new 
      allow(constituency).to receive(:current?).and_return(false)
      allow(constituency).to receive(:name).and_return('Aberavon')
      allow(constituency).to receive(:graph_id).and_return('123')
      @constituencies = [constituency]
    end

    it 'renders an internal partial if there is data' do 
      render partial: 'pugin/elements/list', locals: { item_type: "constituencies", data: @constituencies }
      expect(response).to include("Former constituency")
    end
  end
end
