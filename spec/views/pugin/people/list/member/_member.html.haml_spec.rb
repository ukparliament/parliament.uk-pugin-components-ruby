require 'spec_helper'
require 'haml'

describe 'pugin/people/list/member/_member.html.haml', type: :view do

  context 'with a current MP data set' do

    let(:current_mp_data_set) { Class.new }
    let(:current_mp_seat_incumbency) { Class.new }
    let(:current_mp_constituency) { Class.new }
    let(:current_mp_party) { Class.new }

    before :each do
      allow(current_mp_constituency).to receive(:name).and_return('constituency1')

      allow(current_mp_seat_incumbency).to receive(:constituency).and_return(current_mp_constituency)
      allow(current_mp_seat_incumbency).to receive(:start_date).and_return(DateTime.new(2018, 01, 22, 4, 5, 6))

      allow(current_mp_party).to receive(:name).and_return('Labour')

      allow(current_mp_data_set).to receive(:current_party).and_return(current_mp_party)
      allow(current_mp_data_set).to receive(:most_recent_seat_incumbency).and_return(current_mp_seat_incumbency)
      allow(current_mp_data_set).to receive(:current_seat_incumbency).and_return(current_mp_seat_incumbency)
      allow(current_mp_data_set).to receive(:parties).and_return([current_mp_party])
      allow(current_mp_data_set).to receive(:image_id).and_return('456')
      allow(current_mp_data_set).to receive(:person_type).and_return('member')
      allow(current_mp_data_set).to receive(:graph_id).and_return('123')
      allow(current_mp_data_set).to receive(:display_name).and_return('currentmp1')

      @people = [current_mp_data_set]
    end

    it "renders the current MP data" do
      render partial: "pugin/people/list/list", collection: @people, as: "people".to_sym
      expect(response).to include("<a href='/people/123'>currentmp1</a>")
      expect(response).to include("<p>MP for constituency1</p>")
      expect(response).to include("<p>Labour</p>")
    end
  end

  context 'with a former MP data set' do

    let(:former_mp_data_set) { Class.new }
    let(:former_mp_seat_incumbency) { Class.new }
    let(:former_mp_constituency) { Class.new }

    before :each do

      allow(former_mp_constituency).to receive(:name).and_return('constituency1')

      allow(former_mp_seat_incumbency).to receive(:current?).and_return(false)
      allow(former_mp_seat_incumbency).to receive(:start_date).and_return(DateTime.new(2018, 01, 22, 4, 5, 6))

      allow(former_mp_data_set).to receive(:most_recent_seat_incumbency).and_return(former_mp_seat_incumbency)
      allow(former_mp_data_set).to receive(:current_seat_incumbency).and_return(nil)
      allow(former_mp_data_set).to receive(:graph_id).and_return('123')
      allow(former_mp_data_set).to receive(:display_name).and_return('formermp1')
      allow(former_mp_data_set).to receive(:statuses).and_return({house_membership_status: ['Former MP']})
      allow(former_mp_data_set).to receive(:image_id).and_return('456')
      allow(former_mp_data_set).to receive(:person_type).and_return('member')

      @people = [former_mp_data_set]
    end

    it "renders the former MP data" do
      render partial: "pugin/people/list/list", collection: @people, as: "people".to_sym
      expect(response).to include("<a href='/people/123'>formermp1</a>")
      expect(response).to include("<p>Former MP</p>")
    end
  end

  context 'with a parliament MP data set' do

    let(:parliament_mp_data_set) { Class.new }
    let(:parliament_mp_seat_incumbency) { Class.new }
    let(:parliament_mp_constituency) { Class.new }
    let(:parliament_mp_party) { Class.new }

    before :each do
      @parliament = [1,2,3]

      allow(parliament_mp_constituency).to receive(:name).and_return('constituency1')

      allow(parliament_mp_seat_incumbency).to receive(:current?).and_return(false)
      allow(parliament_mp_seat_incumbency).to receive(:start_date).and_return(DateTime.new(2017,2,3,4,0,0))
      allow(parliament_mp_seat_incumbency).to receive(:end_date).and_return(DateTime.new(2018,3,16,3,0,0))
      allow(parliament_mp_seat_incumbency).to receive(:constituency).and_return(parliament_mp_constituency)

      allow(parliament_mp_party).to receive(:name).and_return('Green Party')

      allow(parliament_mp_data_set).to receive(:most_recent_seat_incumbency).and_return(parliament_mp_seat_incumbency)
      allow(parliament_mp_data_set).to receive(:current_seat_incumbency).and_return(parliament_mp_seat_incumbency)
      allow(parliament_mp_data_set).to receive(:parties).and_return([parliament_mp_party])
      allow(parliament_mp_data_set).to receive(:person_type).and_return('member')
      allow(parliament_mp_data_set).to receive(:image_id).and_return('456')
      allow(parliament_mp_data_set).to receive(:graph_id).and_return('123')
      allow(parliament_mp_data_set).to receive(:display_name).and_return('parliamentmp1')

      @people = [parliament_mp_data_set]
    end

    it "renders the parliament MP data" do
      render partial: "pugin/people/list/list", collection: @people, as: "people".to_sym
      expect(response).to include("<a href='/people/123'>parliamentmp1</a>")
      expect(response).to include("<p>
constituency1 from 3 Feb 2017
- 16 Mar 2018
</p>")
      expect(response).to include("<p>Green Party</p>")
    end

    context 'current' do
      before :each do
        allow(@people.first.current_seat_incumbency).to receive(:end_date).and_return(nil)
      end

      it "renders the parliament MP data" do
        render partial: "pugin/people/list/list", collection: @people, as: "people".to_sym
        expect(response).to include("<a href='/people/123'>parliamentmp1</a>")
        expect(response).to include("<p>
constituency1 from 3 Feb 2017
to present
</p>")
        expect(response).to include("<p>Green Party</p>")
      end

    end
  end
end
