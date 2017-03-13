require 'spec_helper'
require 'haml'

describe 'pugin/components/_header.html.haml', type: :view do

  it 'renders as expected' do
    render

    expect(response).to eq(<<DATA
<header>
<div class='container--full-screen header'>
<div class='container--full-grid'>
<div class='row--indent-horizontal'>
<div class='header__logo'>
<a href='/'>
<img alt='parliament.uk' src='//images/parliament-uk--white.png' srcset='//images/parliament-uk--white.svg'>
</a>
</div>
</div>
</div>
</div>
</header>
DATA
                          )
  end

end
