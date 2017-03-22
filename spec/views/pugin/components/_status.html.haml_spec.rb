require 'spec_helper'
require 'haml'

describe 'pugin/components/_status.html.haml', type: :view do

  context 'without a status message' do
    it 'renders as expected' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(response).to eq(
<<DATA
<div class='highlight__status'>
<div class='container--full-screen status'>
<div class='container--full-grid'>
<div class='row--indent-horizontal'>
<p>This is a test website, so may be inaccurate or misleading - <a target="_blank" title="website opens in a new window" href="https://ukparliament-self.achieveservice.com/en/AchieveForms/?form_uri=sandbox-publish://AF-Process-032e1b1d-958f-4402-9ab2-97a38ed9b899/AF-Stage9b7ecae8-0c85-4ee7-afda-b256cffe5f08/definition.json&amp;redirectlink=%2F&amp;cancelRedirectLink=%2F&amp;category=AF-Category-48936b5c-9329-48c7-a0a5-563463aacadf">give feedback</a> to help improve it. Return to <a href="https://www.parliament.uk">current website</a>.</p>
</div>
</div>
</div>
</div>
DATA
      )
    end
  end

  context 'with a status message' do
    it 'renders as expected' do
      render partial: 'pugin/components/status', locals: { status: "test" }

      expect(rendered).to eq(
<<DATA
<div class='highlight__status'>
<div class='container--full-screen status__test'>
<div class='container--full-grid'>
<div class='row--indent-horizontal'>
<p>This is a test website, so may be inaccurate or misleading - <a target="_blank" title="website opens in a new window" href="https://ukparliament-self.achieveservice.com/en/AchieveForms/?form_uri=sandbox-publish://AF-Process-032e1b1d-958f-4402-9ab2-97a38ed9b899/AF-Stage9b7ecae8-0c85-4ee7-afda-b256cffe5f08/definition.json&amp;redirectlink=%2F&amp;cancelRedirectLink=%2F&amp;category=AF-Category-48936b5c-9329-48c7-a0a5-563463aacadf">give feedback</a> to help improve it. Return to <a href="https://www.parliament.uk">current website</a>.</p>
</div>
</div>
</div>
</div>
DATA
      )
    end
  end

end
