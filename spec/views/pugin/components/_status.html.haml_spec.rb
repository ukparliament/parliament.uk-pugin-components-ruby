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
<a href='https://ukparliament-self.achieveservice.com/AchieveForms/?form_uri=sandbox://AF-Form-337e2b87-4c8b-40f7-bb72-a80f15284b21&amp;amp;category=AF-Category-108691b0-e15c-46d7-9d16-7ad0d35cdb2a&amp;amp;isPublished=false' target='_blank' title='website opens in a new window'>Give feedback</a>
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
      p FlagHelper.dissolution?
      expect(response).to eq(
<<DATA
<div class='highlight__status highlight--default'>
<div class='container'>
<p>
This is a test website, so may be inaccurate.
<a href='https://ukparliament-self.achieveservice.com/AchieveForms/?form_uri=sandbox://AF-Form-337e2b87-4c8b-40f7-bb72-a80f15284b21&amp;amp;category=AF-Category-108691b0-e15c-46d7-9d16-7ad0d35cdb2a&amp;amp;isPublished=false' target='_blank' title='website opens in a new window'>Give feedback</a>
to help improve it.
<a href='https://www.gov.uk/register-to-vote'>Register to vote</a>
in the General Election by 22 May.
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
<div class='highlight__status highlight--default'>
<div class='container'>
<p>
This is a test website, so may be inaccurate.
<a href='https://ukparliament-self.achieveservice.com/AchieveForms/?form_uri=sandbox://AF-Form-337e2b87-4c8b-40f7-bb72-a80f15284b21&amp;amp;category=AF-Category-108691b0-e15c-46d7-9d16-7ad0d35cdb2a&amp;amp;isPublished=false' target='_blank' title='website opens in a new window'>Give feedback</a>
to help improve it.
Remember to vote in the general election on 8th June.
</p>
</div>
</div>
DATA
      )
    end
  end

end
