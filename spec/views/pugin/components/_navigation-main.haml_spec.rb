require 'spec_helper'
require 'haml'

describe 'pugin/components/_navigation-main.haml', type: :view do

  context 'enable menu' do
    it 'renders as expected' do
      render

      expect(response).to eq(<<DATA
<nav aria-label='navigation' class='navigation--main'>
<div class='container'>
<ul>
<li>
<a href='/houses/KL2k1BGP/members/current/a-z/a'>MPs</a>
</li>
<li>
<a href='/houses/m1EgVTLj/members/current/a-z/a'>Lords</a>
</li>
<li>
<a href='/houses/KL2k1BGP/parties/current'>Parties</a>
</li>
<li>
<a href='/constituencies/current/a-z/a'>Constituencies</a>
</li>
</ul>
</div>
</nav>
DATA
      )
    end
  end

  context 'disable menu' do
    it 'does not render' do
      render if @disable_navigation_main

      expect(response).to be_empty
    end
  end

end