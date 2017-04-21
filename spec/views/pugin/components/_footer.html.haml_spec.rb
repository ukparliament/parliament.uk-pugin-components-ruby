require 'spec_helper'
require 'haml'

describe 'pugin/components/_footer.html.haml', type: :view do

  it 'renders as expected' do
    render

    expect(response).to eq(<<DATA
<footer>
<div class='container'>
<h2 class='logo'>UK Parliament</h2>
<ul class='list'>
<li>
<a href='https://www.parliament.uk/'>Current Parliament.uk website</a>
</li>
<li>
<a href='http://beta.parliament.uk/meta/cookie-policy'>Cookie Policy</a>
</li>
</ul>
</div>
</footer>
DATA
                        )
  end

end
