require 'spec_helper'
require 'haml'

describe 'pugin/components/_status.html.haml', type: :view do
  
  context 'while not in a dissolution' do

  	before :each do 
      allow(Pugin::Feature::Bandiera).to receive(:dissolution?).and_return(false)
      allow(Pugin::Feature::Bandiera).to receive(:register_to_vote?).and_return(false)
      allow(Pugin::Feature::Bandiera).to receive(:election?).and_return(false)
    end

    it 'renders a message not related to the dissolution' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(rendered).not_to include(I18n.t('pugin.components.status.election_text_1'))
      expect(rendered).not_to include(I18n.t('pugin.components.status.election_text_3'))
      expect(rendered).not_to include(I18n.t('pugin.components.status.how_to_vote'))
    end
  end

  context 'while in a dissolution and still able to register to vote' do

  	before :each do 
      allow(Pugin::Feature::Bandiera).to receive(:dissolution?).and_return(true)
      allow(Pugin::Feature::Bandiera).to receive(:register_to_vote?).and_return(true)
    end

    it 'renders a message that shows a link to register to vote' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(rendered).to include("<a href='https://www.gov.uk/register-to-vote'>Register to vote</a>")
    end
  end

  context 'while in a dissolution and registration has closed' do

  	before :each do 
  	  allow(Pugin::Feature::Bandiera).to receive(:dissolution?).and_return(true)
      allow(Pugin::Feature::Bandiera).to receive(:register_to_vote?).and_return(false)
    end

    it 'renders a message that reminds the user of the general election date' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(rendered).to include(I18n.t('pugin.components.status.election_text_2'))
    end
  end

  context 'while on election day' do

    before :each do
      allow(Pugin::Feature::Bandiera).to receive(:dissolution?).and_return(false)
      allow(Pugin::Feature::Bandiera).to receive(:register_to_vote?).and_return(false)
      allow(Pugin::Feature::Bandiera).to receive(:election?).and_return(true)
    end

    it 'renders a message that reminds the user of the general election date' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(rendered).to include(I18n.t('pugin.components.status.election_day_text'))
    end
  end


end
