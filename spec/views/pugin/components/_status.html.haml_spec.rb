require 'spec_helper'
require 'haml'

describe 'pugin/components/_status.html.haml', type: :view do

  context 'without a status message' do
    it 'renders as expected' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(response).to eq(
<<DATA
<div class='highlight__status highlight--default'>
<div class='container'>
<p>
This is a test website, so may be inaccurate or misleading
 - <a href='https://ukparliament-self.achieveservice.com/AchieveForms/?form_uri=sandbox://AF-Form-337e2b87-4c8b-40f7-bb72-a80f15284b21&amp;amp;category=AF-Category-108691b0-e15c-46d7-9d16-7ad0d35cdb2a&amp;amp;isPublished=false' target='_blank' title='website opens in a new window'>give feedback</a>
to help improve it. Return to
<a href='https://www.parliament.uk'>current website</a>.
</p>
</div>
</div>
DATA
      )
    end
  end

end
