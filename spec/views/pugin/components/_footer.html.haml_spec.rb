require 'spec_helper'
require 'haml'

describe 'pugin/components/_footer.html.haml', type: :view do

  it 'renders as expected' do
    render

    expect(response).to eq(
<<DATA
<footer>
<div class='c-fs footer'>
<div class='c-fg'>
<div class='row'>
<div class='footer__logo'></div>
<ul class='footer__list'>
<li>Parliament.uk <a href="#">digital blog</a></li>
<li>Visit the <a href="#">current parliament.uk</a> website</li>
<li><a href="#">Cookie Policy</a></li>
</ul>
</div>
</div>
</div>
</footer>
DATA
                        )
  end

end
