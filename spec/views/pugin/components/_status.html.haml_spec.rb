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

      expect(response).to eq(
<<DATA
<div class='status--banner'>
<div class='container'>
<p>
<img alt='' aria-hidden='true' aria-label='caution' class='icon--inline' src='https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/1.6.3/icons/caution-circle-white.svg'>
<span class='sr-only'>caution</span>
This is a test website, so may be inaccurate.
<a href='http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/'>Give feedback</a>
to help improve it.
</p>
</div>
</div>
DATA
      )
    end
  end

  context 'while in a dissolution and still able to register to vote' do

  	before :each do 
      allow(Pugin::Feature::Bandiera).to receive(:dissolution?).and_return(true)
      allow(Pugin::Feature::Bandiera).to receive(:register_to_vote?).and_return(true)
    end

    it 'renders a message that shows a link to register to vote' do
      render partial: 'pugin/components/status', locals: { status: nil }
      expect(response).to eq(
<<DATA
<div class='status--banner'>
<div class='container'>
<p>
<img alt='' aria-hidden='true' aria-label='caution' class='icon--inline' src='https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/1.6.3/icons/caution-circle-white.svg'>
<span class='sr-only'>caution</span>
This is a test website, so may be inaccurate.
<a href='http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/'>Give feedback</a>
to help improve it.
<a href='https://www.gov.uk/register-to-vote'>Register to vote</a>
in the general election by 22 May.
</p>
</div>
</div>
DATA
      )
    end
  end

  context 'while in a dissolution and registration has closed' do

  	before :each do 
  	  allow(Pugin::Feature::Bandiera).to receive(:dissolution?).and_return(true)
      allow(Pugin::Feature::Bandiera).to receive(:register_to_vote?).and_return(false)
    end

    it 'renders a message that reminds the user of the general election date' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(response).to eq(
<<DATA
<div class='status--banner'>
<div class='container'>
<p>
<img alt='' aria-hidden='true' aria-label='caution' class='icon--inline' src='https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/1.6.3/icons/caution-circle-white.svg'>
<span class='sr-only'>caution</span>
This is a test website, so may be inaccurate.
<a href='http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/'>Give feedback</a>
to help improve it.
Find out
<a href='http://www.parliament.uk/get-involved/elections/voting/'>how to vote</a>
in the general election on 8 June.
</p>
</div>
</div>
DATA
      )
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

      expect(response).to eq(
<<DATA
<div class='status--banner'>
<div class='container'>
<p>
<img alt='' aria-hidden='true' aria-label='caution' class='icon--inline' src='https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/1.6.3/icons/caution-circle-white.svg'>
<span class='sr-only'>caution</span>
This is a test website, so may be inaccurate.
<a href='http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/'>Give feedback</a>
to help improve it.
Thursday 8 June is election day, find out
<a href='http://www.parliament.uk/get-involved/elections/voting/'>how to vote</a>.
</p>
</div>
</div>
DATA
      )
    end
  end


end
