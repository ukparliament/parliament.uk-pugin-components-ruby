require 'spec_helper'
require 'haml'

describe 'pugin/components/_header.html.haml', type: :view do

  it 'renders as expected' do
    render

    expect(response).to eq(<<DATA
<header>
<div class='container'>
<a href='/'>
<img alt='UK Parliament' class='logo' src='https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/1.4.6/images/uk_parliament_logo.png' srcset='https://s3-eu-west-1.amazonaws.com/web1live.pugin-website/1.4.6/images/uk_parliament_logo.svg'>
</a>
</div>
</header>
DATA
                          )
  end

end
