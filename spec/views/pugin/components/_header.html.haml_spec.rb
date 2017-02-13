require 'spec_helper'
require 'haml'

describe 'pugin/components/_header.html.haml', type: :view do

  it 'renders as expected' do
    render

    expect(response).to eq(<<DATA
<header>
<div class='c-fs header'>
<div class='c-fg'>
<div class='row'>
<div class='header__logo'>
<a href='/'>
<img alt='parliament.uk' src='http://ukpds.pugin-website.s3-website-eu-west-1.amazonaws.com/images/parliament-uk--white-50.png' srcset='http://ukpds.pugin-website.s3-website-eu-west-1.amazonaws.com/images/parliament-uk--white-50.svg'>
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
