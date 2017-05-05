require 'spec_helper'
require 'haml'

describe 'pugin/components/_navigation-letter.html.haml', type: :view do

  context 'with no data' do

    before :each do
      @letters = []
    end

    it 'displays a navigation list with no links' do
      render partial: 'pugin/components/navigation-letter', locals: { route_symbol: '/people' }

      expect(rendered).to eq(
<<DATA
<p>
A to Z -
select a letter
</p>
<nav aria-label='Paged navigation' class='navigation--letter'>
<ul>
<li data-letter='a'>
a
</li>
<li data-letter='b'>
b
</li>
<li data-letter='c'>
c
</li>
<li data-letter='d'>
d
</li>
<li data-letter='e'>
e
</li>
<li data-letter='f'>
f
</li>
<li data-letter='g'>
g
</li>
<li data-letter='h'>
h
</li>
<li data-letter='i'>
i
</li>
<li data-letter='j'>
j
</li>
<li data-letter='k'>
k
</li>
<li data-letter='l'>
l
</li>
<li data-letter='m'>
m
</li>
<li data-letter='n'>
n
</li>
<li data-letter='o'>
o
</li>
<li data-letter='p'>
p
</li>
<li data-letter='q'>
q
</li>
<li data-letter='r'>
r
</li>
<li data-letter='s'>
s
</li>
<li data-letter='t'>
t
</li>
<li data-letter='u'>
u
</li>
<li data-letter='v'>
v
</li>
<li data-letter='w'>
w
</li>
<li data-letter='x'>
x
</li>
<li data-letter='y'>
y
</li>
<li data-letter='z'>
z
</li>
</ul>
</nav>
DATA
                              )
    end
  end
end