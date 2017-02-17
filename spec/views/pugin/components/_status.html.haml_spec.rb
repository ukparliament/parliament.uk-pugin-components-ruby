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
<p>This is a <a href="/"><strong>BETA</strong></a>. Give <a href="#">feedback</a> to improve it.</p>
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
<p>This is a <a href="/"><strong>BETA</strong></a>. Give <a href="#">feedback</a> to improve it.</p>
</div>
</div>
</div>
</div>
DATA
      )
    end
  end

end
