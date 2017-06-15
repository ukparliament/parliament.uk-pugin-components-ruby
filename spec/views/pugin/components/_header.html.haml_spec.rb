require 'spec_helper'
require 'haml'

describe 'pugin/components/_header.html.haml', type: :view do

  it 'renders as expected' do
    render

    expect(response).to eq(<<DATA
<header>
<div class='container'>
<a href='/'>
<img alt='UK Parliament' class='logo' src='https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/images/uk_parliament_logo_white.png' srcset='https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/images/uk_parliament_logo_white.svg'>
</a>
</div>
</header>
DATA
                          )
  end

end
