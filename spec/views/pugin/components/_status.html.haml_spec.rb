require 'spec_helper'
require 'haml'

describe 'pugin/components/_status.html.haml', type: :view do
  
  context 'while not in a dissolution' do

  	before :each do 
  	  module FlagHelper
  		def self.dissolution? 
  			false
  		end
  		def self.register_to_vote? 
  			false
  		end
  	  end
    end

    it 'renders a message not related to the dissolution' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(response).to eq(
<<DATA
<div class='highlight--status highlight--default'>
<div class='container'>
<p>
This is a test website, so may be inaccurate.
<a href='http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/' target='_blank' title='website opens in a new window'>Give feedback</a>
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
  	  module FlagHelper
  		def self.dissolution? 
  			true
  		end
  		def self.register_to_vote? 
  			true
  		end
  	  end
    end

    it 'renders a message that shows a link to register to vote' do
      render partial: 'pugin/components/status', locals: { status: nil }
      expect(response).to eq(
<<DATA
<div class='highlight--status highlight--default'>
<div class='container'>
<p>
This is a test website, so may be inaccurate.
<a href='http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/' target='_blank' title='website opens in a new window'>Give feedback</a>
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
  	  module FlagHelper
  		def self.dissolution? 
  			true
  		end
  		def self.register_to_vote? 
  			false
  		end
  	  end
    end

    it 'renders a message that reminds the user of the general election date' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(response).to eq(
<<DATA
<div class='highlight--status highlight--default'>
<div class='container'>
<p>
This is a test website, so may be inaccurate.
<a href='http://www.smartsurvey.co.uk/s/ukparliament-beta-website-feedback/' target='_blank' title='website opens in a new window'>Give feedback</a>
to help improve it.
Find out
<a href='http://www.parliament.uk/get-involved/elections/voting/' target='_blank' title='website opens in a new window'>how to vote</a>
in the general election on 8 June.
</p>
</div>
</div>
DATA
      )
    end
  end

end
