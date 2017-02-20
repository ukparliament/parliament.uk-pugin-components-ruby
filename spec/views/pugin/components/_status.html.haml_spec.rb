require 'spec_helper'
require 'haml'

describe 'pugin/components/_status.html.haml', type: :view do

  context 'without a status message' do
    it 'renders as expected' do
      render partial: 'pugin/components/status', locals: { status: nil }

      expect(response).to eq(
<<DATA
<div class='highlight__status'>
<div class='c-fs status'>
<div class='c-fg'>
<div class='row--indent-horizontal'>
<p>This is a <a href="/"><strong>BETA</strong></a>. Give <a href="https://ukparliament-self.achieveservice.com/en/AchieveForms/?form_uri=sandbox-publish://AF-Process-032e1b1d-958f-4402-9ab2-97a38ed9b899/AF-Stage9b7ecae8-0c85-4ee7-afda-b256cffe5f08/definition.json&redirectlink=%2F&cancelRedirectLink=%2F&category=AF-Category-48936b5c-9329-48c7-a0a5-563463aacadf">feedback</a> to improve it.</p>
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
<div class='c-fs status__test'>
<div class='c-fg'>
<div class='row--indent-horizontal'>
<p>This is a <a href="/"><strong>BETA</strong></a>. Give <a href="https://ukparliament-self.achieveservice.com/en/AchieveForms/?form_uri=sandbox-publish://AF-Process-032e1b1d-958f-4402-9ab2-97a38ed9b899/AF-Stage9b7ecae8-0c85-4ee7-afda-b256cffe5f08/definition.json&redirectlink=%2F&cancelRedirectLink=%2F&category=AF-Category-48936b5c-9329-48c7-a0a5-563463aacadf">feedback</a> to improve it.</p>
</div>
</div>
</div>
</div>
DATA
      )
    end
  end

end
