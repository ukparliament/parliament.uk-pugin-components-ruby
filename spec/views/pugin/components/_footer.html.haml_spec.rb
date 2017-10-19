require 'spec_helper'
require 'haml'

describe 'pugin/components/_footer.html.haml', type: :view do

  before do
    allow(view).to receive(:root_path).and_return('http://www.parliament.uk')
    allow(view).to receive(:meta_cookie_policy_path).and_return("/meta/cookie-policy")

    render
  end

  it 'renders as expected' do
    expect(response).to eq(<<DATA
<footer>
<div class='container'>
<h2 class='logo'>UK Parliament</h2>
<ul class='list'>
<li><a href="http://www.parliament.uk">Current Parliament.uk website</a></li>
<li><a href="/meta/cookie-policy">Cookie Policy</a></li>
</ul>
</div>
</footer>
DATA
                        )
  end

end
