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
<img alt='parliament.uk' src='//images/parliament-uk--darkgrey.png' srcset='//images/parliament-uk--darkgrey.svg'>
</div>
<ul class='footer__list'>
<li>
Parliament.uk
<a href='https://pds.blog.parliament.uk/' target='_blank'>digital blog</a>
</li>
<li>
Visit the
<a href='https://www.parliament.uk/' target='_blank'>current parliament.uk</a>
website
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
