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
<span>
<a href='/'>UK Parliament</a>
</span>
</div>
</div>
</div>
</div>
</header>
DATA
                          )
  end

end
