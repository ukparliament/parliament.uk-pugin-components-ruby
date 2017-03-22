require 'spec_helper'
require 'haml'

describe 'pugin/cards/_person-list.html.haml', type: :view do

  let(:person) { Class.new }
  let(:seat_incumbency1) { Class.new }
  let(:seat_incumbency2) { Class.new }
  let(:constituency1) { Class.new }
  let(:constituency2) { Class.new }
  let(:party_memberships1) { Class.new }
  let(:party_memberships2) { Class.new }
  let(:party1) { Class.new }
  let(:party2) { Class.new }

  context 'with a fully implemented person' do

    before :each do
      @people = [person]
      allow(person).to receive(:display_name).and_return('Jane Smith')
      allow(person).to receive(:graph_id).and_return('123')

      allow(constituency1).to receive(:name).and_return('Hackney')
      allow(constituency1).to receive(:graph_id).and_return('123')
      allow(constituency2).to receive(:name).and_return('Stoke')
      allow(constituency2).to receive(:graph_id).and_return('456')

      allow(seat_incumbency1).to receive(:current?).and_return(true)
      allow(seat_incumbency1).to receive(:constituency).and_return(constituency1)

      allow(seat_incumbency2).to receive(:current?).and_return(false)
      allow(seat_incumbency2).to receive(:constituency).and_return(constituency2)

      allow(party1).to receive(:name).and_return('Labour')
      allow(party1).to receive(:graph_id).and_return('123')
      allow(party2).to receive(:name).and_return('Conservative')
      allow(party2).to receive(:graph_id).and_return('456')

      allow(party_memberships1).to receive(:current?).and_return(true)
      allow(party_memberships1).to receive(:party).and_return(party1)

      allow(party_memberships2).to receive(:current?).and_return(false)
      allow(party_memberships2).to receive(:party).and_return(party2)

      allow(person).to receive(:seat_incumbencies).and_return([seat_incumbency1, seat_incumbency2])
      allow(person).to receive(:constituencies).and_return([constituency1,constituency2])
      allow(person).to receive(:statuses).and_return({house_membership_status: ['Current MP']})
      allow(person).to receive(:party_memberships).and_return([party_memberships1,party_memberships2])
      allow(person).to receive(:parties).and_return([party1,party2])
    end

    it 'displays all information as expected' do
      render partial: 'pugin/cards/person-list', locals: { people: @people }

      expect(rendered).to eq(
<<DATA
<ol class='list'>
<li class='list__item'>
<h2>
<a href='/people/123'>Jane Smith</a>
</h2>
<p>Current MP for Hackney</p>
<p>Labour</p>
</li>
</ol>
DATA
                              )
    end
  end

  context 'with no people' do
    before :each do
      @people = []
    end

    it 'renders as expected' do
      render partial: 'pugin/cards/person-list', locals: { people: @people, letter: 'a' }

      expect(response).to eq(<<DATA
<ol class='list'>
<li class='list__item'>
<p>Sorry there are no results for 'A'</p>
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
      render partial: 'pugin/cards/person-list', locals: { people: @people }

      expect(rendered).to eq(
<<DATA
<ol class='list'>
</ol>
DATA
                              )
    end
  end

  context 'with no name data' do
    let(:person) { Class.new }

    before :each do
      @people = [person]

      allow(person).to receive(:display_name).and_return('')
      allow(person).to receive(:graph_id).and_return('123')

      allow(constituency1).to receive(:name).and_return('Hackney')
      allow(constituency1).to receive(:graph_id).and_return('123')
      allow(constituency2).to receive(:name).and_return('Stoke')
      allow(constituency2).to receive(:graph_id).and_return('456')

      allow(seat_incumbency1).to receive(:current?).and_return(true)
      allow(seat_incumbency1).to receive(:constituency).and_return(constituency1)

      allow(seat_incumbency2).to receive(:current?).and_return(false)
      allow(seat_incumbency2).to receive(:constituency).and_return(constituency2)

      allow(party1).to receive(:name).and_return('Labour')
      allow(party1).to receive(:graph_id).and_return('123')
      allow(party2).to receive(:name).and_return('Conservative')
      allow(party2).to receive(:graph_id).and_return('456')

      allow(party_memberships1).to receive(:current?).and_return(true)
      allow(party_memberships1).to receive(:party).and_return(party1)

      allow(party_memberships2).to receive(:current?).and_return(false)
      allow(party_memberships2).to receive(:party).and_return(party2)

      allow(person).to receive(:seat_incumbencies).and_return([seat_incumbency1, seat_incumbency2])
      allow(person).to receive(:constituencies).and_return([constituency1,constituency2])
      allow(person).to receive(:statuses).and_return({house_membership_status: ['Current MP']})
      allow(person).to receive(:party_memberships).and_return([party_memberships1,party_memberships2])
      allow(person).to receive(:parties).and_return([party1,party2])
    end

    it 'displays with no name data' do
      render partial: 'pugin/cards/person-list', locals: { people: @people }

      expect(rendered).to eq(
<<DATA
<ol class='list'>
<li class='list__item'>
<h2>
<a href='/people/123'></a>
</h2>
<p>Current MP for Hackney</p>
<p>Labour</p>
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

      allow(person).to receive(:display_name).and_return('Jane Smith')
      allow(person).to receive(:graph_id).and_return('123')

      allow(party1).to receive(:name).and_return('Labour')
      allow(party1).to receive(:graph_id).and_return('123')
      allow(party2).to receive(:name).and_return('Conservative')
      allow(party2).to receive(:graph_id).and_return('456')

      allow(party_memberships1).to receive(:current?).and_return(true)
      allow(party_memberships1).to receive(:party).and_return(party1)

      allow(party_memberships2).to receive(:current?).and_return(false)
      allow(party_memberships2).to receive(:party).and_return(party2)

      allow(person).to receive(:seat_incumbencies).and_return([seat_incumbency1, seat_incumbency2])
      allow(person).to receive(:constituencies).and_return([])
      allow(person).to receive(:statuses).and_return({house_membership_status: ['Current MP']})
      allow(person).to receive(:party_memberships).and_return([party_memberships1,party_memberships2])
      allow(person).to receive(:parties).and_return([party1,party2])
    end

    it 'displays with no constituency data' do
      render partial: 'pugin/cards/person-list', locals: { people: @people }

      expect(rendered).to eq(
<<DATA
<ol class='list'>
<li class='list__item'>
<h2>
<a href='/people/123'>Jane Smith</a>
</h2>
<p>Labour</p>
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
      allow(person).to receive(:display_name).and_return('Jane Smith')
      allow(person).to receive(:graph_id).and_return('123')

      allow(constituency1).to receive(:name).and_return('Hackney')
      allow(constituency1).to receive(:graph_id).and_return('123')
      allow(constituency2).to receive(:name).and_return('Stoke')
      allow(constituency2).to receive(:graph_id).and_return('456')

      allow(seat_incumbency1).to receive(:current?).and_return(true)
      allow(seat_incumbency1).to receive(:constituency).and_return(constituency1)

      allow(seat_incumbency2).to receive(:current?).and_return(false)
      allow(seat_incumbency2).to receive(:constituency).and_return(constituency2)

      allow(person).to receive(:seat_incumbencies).and_return([seat_incumbency1, seat_incumbency2])
      allow(person).to receive(:constituencies).and_return([constituency1,constituency2])
      allow(person).to receive(:statuses).and_return({house_membership_status: ['Current MP']})
      allow(person).to receive(:party_memberships).and_return([party_memberships1,party_memberships2])
      allow(person).to receive(:parties).and_return([])
    end

    it 'displays with no party data' do
      render partial: 'pugin/cards/person-list', locals: { people: @people }

      expect(rendered).to eq(
<<DATA
<ol class='list'>
<li class='list__item'>
<h2>
<a href='/people/123'>Jane Smith</a>
</h2>
<p>Current MP for Hackney</p>
</li>
</ol>
DATA
                              )
    end
  end
end
