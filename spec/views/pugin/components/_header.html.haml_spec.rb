require 'spec_helper'
require 'haml'

describe 'pugin/components/_header.html.haml', type: :view do

  it 'renders as expected' do
    render

    expect(response).to eq(<<DATA
<header>
<div class='container'>
<a class='logo' href='/'>UK Parliament</a>
</div>
</header>
DATA
                          )
  end

end
