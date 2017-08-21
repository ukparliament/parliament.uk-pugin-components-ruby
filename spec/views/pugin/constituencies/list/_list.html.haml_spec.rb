require 'spec_helper'
require 'haml'

describe 'pugin/constituencies/list/_list.html.haml', type: :view do

  context 'with a current constituency data set' do

    before :each do
      constituency = Class.new
      members = Class.new
      party = Class.new
      allow(constituency).to receive(:current_member_display_name).and_return('Test Name')
      allow(constituency).to receive(:current_member_party_name).and_return('Test Party')
      allow(constituency).to receive(:current?).and_return(true)
      allow(constituency).to receive(:name).and_return('Aberavon')
      allow(constituency).to receive(:graph_id).and_return('123')
      allow(constituency).to receive(:members).and_return([])
      @constituencies = [constituency]
    end

    it "shows the constituency's name as a link" do
      render partial: "pugin/constituencies/list/list", collection: @constituencies, as: "constituencies".to_sym
      expect(response).to include("<a href='/constituencies/123'>Aberavon</a>")
    end

    context 'with a current member' do

      before :each do
        constituency = Class.new
        members = Class.new
        party = Class.new
        allow(constituency).to receive(:current_member_display_name).and_return('Test Name')
        allow(constituency).to receive(:current_member_party_name).and_return('Test Party')
        allow(constituency).to receive(:members).and_return([members])
        allow(constituency).to receive(:current?).and_return(true)
        allow(constituency).to receive(:name).and_return('Aberavon')
        allow(constituency).to receive(:graph_id).and_return('123')
        @constituencies = [constituency]
      end

      it "displays the member's name" do
        render partial: "pugin/constituencies/list/list", collection: @constituencies, as: "constituencies".to_sym
        expect(response).to include("<h2>\n<a href='/constituencies/123'>Aberavon</a>\n</h2>")
        expect(response).to include("<p>Test Name</p>")
      end

      it "displays the member's party" do
        render partial: "pugin/constituencies/list/list", collection: @constituencies, as: "constituencies".to_sym
        expect(response).to include("<p>Test Party</p>")
      end
    end

    context 'without a current member' do

      before :each do
        constituency = Class.new
        allow(constituency).to receive(:current?).and_return(true)
        allow(constituency).to receive(:name).and_return('Aberavon')
        allow(constituency).to receive(:graph_id).and_return('123')
        allow(constituency).to receive(:members).and_return([])
        @constituencies = [constituency]
      end

      it 'displays the vacant i18n message' do
        render partial: "pugin/constituencies/list/list", collection: @constituencies, as: "constituencies".to_sym
        expect(response).to include("<h2>\n<a href='/constituencies/123'>Aberavon</a>\n</h2>")
        expect(response).to include("<p>Vacant</p>")
      end
    end
  end

  context 'with a previous constituency data set' do

    before :each do
      constituency = Class.new
      allow(constituency).to receive(:current?).and_return(false)
      allow(constituency).to receive(:name).and_return('Aberavon')
      allow(constituency).to receive(:graph_id).and_return('123')
      allow(constituency).to receive(:start_date).and_return(DateTime.new(1929))
      allow(constituency).to receive(:end_date).and_return(DateTime.new(1950))

      @constituencies = [constituency]
    end

    it 'displays the previous constituency i18n message' do
      render partial: "pugin/constituencies/list/list", collection: @constituencies, as: "constituencies".to_sym
      expect(response).to include("<h2>\n<a href='/constituencies/123'>Aberavon (1929 - 1950)</a>\n</h2>")
      expect(response).to include("<p>Former constituency</p>")
    end
  end

end
