require 'spec_helper'
require 'haml'

describe 'pugin/people/list/member/_member.html.haml', type: :view do

  context 'with a current lord data set' do

    let(:current_lord_data_set) { Class.new }
    let(:current_lord_seat_incumbency) { Class.new }
    let(:current_lord_party) { Class.new }

    before :each do

      allow(current_lord_seat_incumbency).to receive(:current?).and_return(true)
      allow(current_lord_seat_incumbency).to receive(:start_date).and_return(DateTime.new(2018,1,23,4,5,6))

      allow(current_lord_party).to receive(:name).and_return('Labour')

      allow(current_lord_data_set).to receive(:parties).and_return([1,2,3])
      allow(current_lord_data_set).to receive(:most_recent_seat_incumbency).and_return(current_lord_seat_incumbency)
      allow(current_lord_data_set).to receive(:statuses).and_return({house_membership_status: ['Member of the House of Lords']})
      allow(current_lord_data_set).to receive(:current_party).and_return(current_lord_party)
      allow(current_lord_data_set).to receive(:person_type).and_return('lord')
      allow(current_lord_data_set).to receive(:graph_id).and_return('123')
      allow(current_lord_data_set).to receive(:display_name).and_return('currentlord1')
      allow(current_lord_data_set).to receive(:image_id).and_return('456')

      @people = [current_lord_data_set]
    end

    it "renders the current lord data" do
      render partial: "pugin/people/list/list", collection: @people, as: "people".to_sym
      expect(response).to include("<a href='/people/123'>currentlord1</a>")
      expect(response).to include("<p>Member of the House of Lords</p>")
      expect(response).to include("<p>Labour</p>")
    end
  end

  context 'with a former lord data set' do

    let(:former_lord_data_set) { Class.new }
    let(:former_lord_seat_incumbency) { Class.new }

    before :each do

      allow(former_lord_seat_incumbency).to receive(:current?).and_return(false)
      allow(former_lord_seat_incumbency).to receive(:start_date).and_return(DateTime.new(2018,1,23,4,5,6))

      allow(former_lord_data_set).to receive(:most_recent_seat_incumbency).and_return(former_lord_seat_incumbency)
      allow(former_lord_data_set).to receive(:statuses).and_return({house_membership_status: ['Former Member of the House of Lords']})
      allow(former_lord_data_set).to receive(:person_type).and_return('lord')
      allow(former_lord_data_set).to receive(:graph_id).and_return('123')
      allow(former_lord_data_set).to receive(:display_name).and_return('formerlord1')
      allow(former_lord_data_set).to receive(:image_id).and_return('456')

      @people = [former_lord_data_set]
    end

    it "renders the former lord data" do
      render partial: "pugin/people/list/list", collection: @people, as: "people".to_sym
      expect(response).to include("<a href='/people/123'>formerlord1</a>")
      expect(response).to include("<p>Former Member of the House of Lords</p>")
    end
  end

  context 'with a parliament lord data set' do

    let(:parliament_lord_data_set) { Class.new }
    let(:parliament_lord_seat_incumbency) { Class.new }
    let(:parliament_lord_party) { Class.new }
    let(:parliament_lord_party_memberships) { Class.new }
    let(:parliament_lord_statuses) { Class.new }

    before :each do
      @parliament = [1,2,3]

      allow(parliament_lord_seat_incumbency).to receive(:start_date).and_return(DateTime.new(2018,1,23,4,5,6))

      allow(parliament_lord_party).to receive(:name).and_return('Conservative')

      allow(parliament_lord_data_set).to receive(:parties).and_return([parliament_lord_party])
      allow(parliament_lord_data_set).to receive(:most_recent_seat_incumbency).and_return(parliament_lord_seat_incumbency)
      allow(parliament_lord_data_set).to receive(:person_type).and_return('lord')
      allow(parliament_lord_data_set).to receive(:graph_id).and_return('123')
      allow(parliament_lord_data_set).to receive(:display_name).and_return('currentlord1')
      allow(parliament_lord_data_set).to receive(:image_id).and_return('456')

      @people = [parliament_lord_data_set]

    end

    it "renders the parliament lord data" do
      render partial: "pugin/people/list/list", collection: @people, as: "people".to_sym
      expect(response).to include("<a href='/people/123'>currentlord1</a>")
      expect(response).to include("<p>Member of the House of Lords</p>")
      expect(response).to include("<p>Conservative</p>")
    end

  end
end
