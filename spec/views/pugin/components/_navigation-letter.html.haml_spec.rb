require 'spec_helper'
require 'haml'

describe 'pugin/components/_navigation-letter.html.haml', type: :view do

  context 'with all letters containing data' do

    before :each do
      # Variables used in testing
      @primary_id = '1234'
      @secondary_id = '5678'
      @letters = ('A'..'Z').to_a

      # Allow URLS to be generated
      #   - Simple Letter
      ('a'..'z').each do |letter|
        allow(view).to receive(:people_letter_path).with(letter).and_return("/people/a-z/#{letter}")
      end

      #  - Letter with Primary ID
      ('a'..'z').each do |letter|
        allow(view).to receive(:party_members_letter_path).with(@primary_id, letter).and_return("/parties/#{@primary_id}/members/a-z/#{letter}")
      end

      #  - Letter with Primary ID and Secondary ID
      ('a'..'z').each do |letter|
        allow(view).to receive(:house_party_members_letter_path).with(@primary_id, @secondary_id, letter).and_return("/houses/#{@primary_id}/parties/#{@secondary_id}/members/a-z/#{letter}")
      end

    end

    # Test for simple letter
    context 'and with no active letter' do
      before :each do
        render partial: 'pugin/components/navigation-letter', locals: { route_symbol: :people_letter_path }
      end
      ('a'..'z').each do |letter|
        it "doesn't render any list items with the active class" do
          expect(rendered).not_to include("<li class='active' data-letter=#{letter}>")
        end
      end
    end

    context 'and with an active letter "a"' do
      before :each do
        params[:letter] = "a"
        render partial: 'pugin/components/navigation-letter', locals: { route_symbol: :people_letter_path }
      end
      it "renders the list items with the active class and no link" do
        expect(rendered).to include("<li class='active' data-letter='a'>\n<span>a</span>\n</li>")
      end
    end

    context 'and with route arguments' do 
      before :each do 
        render partial: 'pugin/components/navigation-letter', locals: { route_symbol: :house_party_members_letter_path, route_args:[@primary_id,@secondary_id] }
      end

      ('a'..'z').each do |letter|
        it "renders a navigation link for /houses/1234/parties/5678/members/a-z/#{letter}" do
          expect(rendered).to include("<a data-atoz-see=\"true\" href=\"/houses/1234/parties/5678/members/a-z/#{letter}\">#{letter}</a>")
        end
      end
    end

    context "doesn't render links for empty letters" do
      before :each do
        @letters = []
        render partial: 'pugin/components/navigation-letter', locals: { route_symbol: :party_members_letter_path, route_args: [@primary_id] }
      end

      ('a'..'z').each do |letter|
        it "just renders the letter #{letter}" do
          expect(rendered).not_to include("<a data-atoz-see=\"true\" href=\"/parties/1234/members/a-z/#{letter}\">#{letter}</a>")
          expect(rendered).to include("")
        end
      end
    end
  end
end
