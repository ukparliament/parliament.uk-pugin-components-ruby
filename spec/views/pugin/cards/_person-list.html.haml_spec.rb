require 'spec_helper'
require 'haml'

describe 'pugin/cards/_person-list.html.haml', type: :view do

  let(:person) { Class.new }
  let(:constituency1) { Class.new }
  let(:constituency2) { Class.new }
  let(:party1) { Class.new }
  let(:party2) { Class.new }

  context 'with a fully implemented person' do

    before :each do
      @people = [person]
      allow(person).to receive(:full_name).and_return('Jane Smith')
      allow(person).to receive(:graph_id).and_return('123')

      allow(constituency1).to receive(:name).and_return('Hackney')
      allow(constituency1).to receive(:graph_id).and_return('123')
      allow(constituency2).to receive(:name).and_return('Stoke')
      allow(constituency2).to receive(:graph_id).and_return('456')
      allow(person).to receive(:constituencies).and_return([constituency1,constituency2])

      allow(party1).to receive(:name).and_return('Labour')
      allow(party1).to receive(:graph_id).and_return('123')
      allow(party2).to receive(:name).and_return('Conservative')
      allow(party2).to receive(:graph_id).and_return('456')
      allow(person).to receive(:parties).and_return([party1,party2])
    end

    it 'displays all information as expected' do
      render partial: 'pugin/cards/person-list', locals: { person: @people }

      expect(rendered).to eq(
<<DATA
<ol class='result-list'>
<li class='result-list__item'>
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
</li>
</ol>
DATA
                              )
    end
  end

  context 'with no data' do
    let(:person) { Class.new }

    before :each do
      @people = [person]
      allow(person).to receive(:constituencies).and_return([])
      allow(person).to receive(:parties).and_return([])
    end

    it 'displays with no data' do
      render partial: 'pugin/cards/person-list', locals: { person: @people }

      expect(rendered).to eq(
<<DATA
<ol class='result-list'>
<li class='result-list__item'>
<ul>
</ul>
</li>
</ol>
DATA
                              )
    end
  end

  context 'with no name data' do
    let(:person) { Class.new }

    before :each do
      @people = [person]

      allow(constituency1).to receive(:name).and_return('Hackney')
      allow(constituency1).to receive(:graph_id).and_return('123')
      allow(constituency2).to receive(:name).and_return('Stoke')
      allow(constituency2).to receive(:graph_id).and_return('456')
      allow(person).to receive(:constituencies).and_return([constituency1,constituency2])

      allow(party1).to receive(:name).and_return('Labour')
      allow(party1).to receive(:graph_id).and_return('123')
      allow(party2).to receive(:name).and_return('Conservative')
      allow(party2).to receive(:graph_id).and_return('456')
      allow(person).to receive(:parties).and_return([party1,party2])
    end

    it 'displays with no name data' do
      render partial: 'pugin/cards/person-list', locals: { person: @people }

      expect(rendered).to eq(
<<DATA
<ol class='result-list'>
<li class='result-list__item'>
<ul>
<li>
MP for
<a href='/constituencies/123'>Hackney</a>
</li>
<li>
<a href='/parties/123'>Labour</a>
</li>
</ul>
</li>
</ol>
DATA
                              )
    end
  end

  context 'with no constituency data' do
    let(:person) { Class.new }

    before :each do
      @people = [person]

      allow(person).to receive(:full_name).and_return('Jane Smith')
      allow(person).to receive(:graph_id).and_return('123')

      allow(person).to receive(:constituencies).and_return([])

      allow(party1).to receive(:name).and_return('Labour')
      allow(party1).to receive(:graph_id).and_return('123')
      allow(party2).to receive(:name).and_return('Conservative')
      allow(party2).to receive(:graph_id).and_return('456')
      allow(person).to receive(:parties).and_return([party1,party2])
    end

    it 'displays with no constituency data' do
      render partial: 'pugin/cards/person-list', locals: { person: @people }

      expect(rendered).to eq(
<<DATA
<ol class='result-list'>
<li class='result-list__item'>
<ul>
<li>
<a href='/people/123'>Jane Smith</a>
</li>
<li>
<a href='/parties/123'>Labour</a>
</li>
</ul>
</li>
</ol>
DATA
                              )
    end
  end

  context 'with no party data' do
    let(:person) { Class.new }

    before :each do
      @people = [person]
      allow(person).to receive(:full_name).and_return('Jane Smith')
      allow(person).to receive(:graph_id).and_return('123')

      allow(constituency1).to receive(:name).and_return('Hackney')
      allow(constituency1).to receive(:graph_id).and_return('123')
      allow(constituency2).to receive(:name).and_return('Stoke')
      allow(constituency2).to receive(:graph_id).and_return('456')
      allow(person).to receive(:constituencies).and_return([constituency1,constituency2])

      allow(person).to receive(:parties).and_return([])
    end

    it 'displays with no party data' do
      render partial: 'pugin/cards/person-list', locals: { person: @people }

      expect(rendered).to eq(
<<DATA
<ol class='result-list'>
<li class='result-list__item'>
<ul>
<li>
<a href='/people/123'>Jane Smith</a>
</li>
<li>
MP for
<a href='/constituencies/123'>Hackney</a>
</li>
</ul>
</li>
</ol>
DATA
                              )
    end
  end
end
