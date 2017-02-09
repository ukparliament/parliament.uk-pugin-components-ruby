require 'spec_helper'
require 'haml'

describe 'pugin/cards/_person-list.html.haml', type: :view do
  context 'with a fully implemented person' do
    let(:person) { double('Grom::Node') }

    before :each do
      allow(person).to receive(:name).and_return('Jane Smith')
      allow(person).to receive(:id).and_return('123')
      allow(person).to receive(:constituency).and_return('Hackney')
      allow(person).to receive(:constituency_id).and_return('123')
      allow(person).to receive(:party).and_return('Labour')
      allow(person).to receive(:party_id).and_return('123')
    end

    it 'displays all information as expected' do
      render partial: 'pugin/cards/person-list', locals: { person: person }

      expect(rendered).to eq(
<<DATA
<div class='card__list'>
<ul>
<li>
<a href='/people/123'>Jane Smith</a>
</li>
<li>
MP for
<a href='/constituencies/123'>Hackney</a>
</li>
<li>
<a href='/parties/123'>Labour</a>
</li>
</ul>
</div>
DATA
                              )
    end
  end

  context 'with no data' do
    let(:person) { double('Grom::Node') }

    it 'displays with no data' do
      render partial: 'pugin/cards/person-list', locals: { person: nil }

      expect(rendered).to eq(
<<DATA
<div class='card__list'>
<ul>
</ul>
</div>
DATA
                              )
    end
  end

  context 'with no name data' do
    let(:person) { double('Grom::Node') }

    before :each do
      allow(person).to receive(:constituency).and_return('Hackney')
      allow(person).to receive(:constituency_id).and_return('123')
      allow(person).to receive(:party).and_return('Labour')
      allow(person).to receive(:party_id).and_return('123')
    end

    it 'displays with no name data' do
      render partial: 'pugin/cards/person-list', locals: { person: person }

      expect(rendered).to eq(
<<DATA
<div class='card__list'>
<ul>
<li>
MP for
<a href='/constituencies/123'>Hackney</a>
</li>
<li>
<a href='/parties/123'>Labour</a>
</li>
</ul>
</div>
DATA
                              )
    end
  end

  context 'with no constituency data' do
    let(:person) { double('Grom::Node') }

    before :each do
      allow(person).to receive(:name).and_return('Jane Smith')
      allow(person).to receive(:id).and_return('123')
      allow(person).to receive(:party).and_return('Labour')
      allow(person).to receive(:party_id).and_return('123')
    end

    it 'displays with no constituency data' do
      render partial: 'pugin/cards/person-list', locals: { person: person }

      expect(rendered).to eq(
<<DATA
<div class='card__list'>
<ul>
<li>
<a href='/people/123'>Jane Smith</a>
</li>
<li>
<a href='/parties/123'>Labour</a>
</li>
</ul>
</div>
DATA
                              )
    end
  end

  context 'with no party data' do
    let(:person) { double('Grom::Node') }

    before :each do
      allow(person).to receive(:name).and_return('Jane Smith')
      allow(person).to receive(:id).and_return('123')
      allow(person).to receive(:constituency).and_return('Hackney')
      allow(person).to receive(:constituency_id).and_return('123')
    end

    it 'displays with no party data' do
      render partial: 'pugin/cards/person-list', locals: { person: person }

      expect(rendered).to eq(
<<DATA
<div class='card__list'>
<ul>
<li>
<a href='/people/123'>Jane Smith</a>
</li>
<li>
MP for
<a href='/constituencies/123'>Hackney</a>
</li>
</ul>
</div>
DATA
                              )
    end
  end
end
