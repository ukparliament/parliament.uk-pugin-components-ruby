require 'spec_helper'
require 'haml'

describe 'pugin/components/_status.html.haml', type: :view do

  it 'renders as expected' do
    render

    expect(response).to eq(
<<DATA
<div class='c-fs status'>
<div class='c-fg'>
<div class='row'>
<p>This is a <a href="beta-services.html"><strong>BETA</strong></a>. Give <a href="feedback.html">feedback</a> to improve it.</p>
</div>
</div>
</div>
DATA
    )
  end

end
