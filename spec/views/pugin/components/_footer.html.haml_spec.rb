require 'spec_helper'
require 'haml'

describe 'pugin/components/_footer.html.haml', type: :view do

  it 'renders as expected' do
    render

    expect(response).to eq(<<DATA
<footer>
<div class='container--full-screen footer'>
<div class='container--full-grid'>
<div class='row--indent-horizontal'>
<div class='footer__logo'>
<p>Parliament.uk</p>
</div>
<ul class='footer__list'>
<li>
<a href='https://pds.blog.parliament.uk/' target='_blank'>Parliamentary Digital Service blog</a>
</li>
<li>
<a href='https://www.parliament.uk/' target='_blank'>Current Parliament.uk website</a>
</li>
<li>
<a href='/meta/cookie-policy'>Cookie Policy</a>
</li>
</ul>
</div>
</div>
</div>
</footer>
DATA
                        )
  end

end
