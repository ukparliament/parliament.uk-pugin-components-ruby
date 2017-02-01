require 'spec_helper'

describe 'pugin/cards/_person.html.erb', type: :view do
  context 'with a fully implemented person' do
    let(:person) { double('Grom::Node') }

    before :each do
      allow(person).to receive(:name).and_return('Jane Smith')
      allow(person).to receive(:position).and_return('Minister for Tests')
      allow(person).to receive(:id).and_return('123')
    end

    it 'displays all information as expected' do
      render partial: 'pugin/cards/person', locals: { person: person }

      expect(rendered).to eq(<<DATA
<div class="card card-small">
  <h3>Jane Smith</h3>
  <p><strong>Minister for Tests</strong></p>
    <a class="cta" href="/people/123">Find out more</a>
</div>
DATA
                            )
    end
  end

  context 'with no person' do
    it 'displays with no data' do
      render partial: 'pugin/cards/person', locals: { person: nil }

      expect(rendered).to eq( <<DATA
<div class="card card-small">
  <h3></h3>
  <p><strong></strong></p>
</div>
DATA
                            )
    end
  end

  context 'with a partially implemented person' do
    let(:person) { double('Grom::Node') }

    context 'with no name' do
      before :each do
        allow(person).to receive(:position).and_return('Minister for Tests')
        allow(person).to receive(:id).and_return('123')
      end

      it 'displays information as expected' do
        render partial: 'pugin/cards/person', locals: { person: person }

        expect(rendered).to eq(<<DATA
<div class="card card-small">
  <h3></h3>
  <p><strong>Minister for Tests</strong></p>
    <a class="cta" href="/people/123">Find out more</a>
</div>
DATA
                            )
      end
    end

    context 'with no position' do
      before :each do
        allow(person).to receive(:name).and_return('Jane Smith')
        allow(person).to receive(:id).and_return('123')
      end

      it 'displays information as expected' do
        render partial: 'pugin/cards/person', locals: { person: person }

        expect(rendered).to eq(<<DATA
<div class="card card-small">
  <h3>Jane Smith</h3>
  <p><strong></strong></p>
    <a class="cta" href="/people/123">Find out more</a>
</div>
DATA
                            )
      end
    end

    context 'with no id' do
      before :each do
        allow(person).to receive(:name).and_return('Jane Smith')
        allow(person).to receive(:position).and_return('Minister for Tests')
      end

      it 'displays information as expected' do
        render partial: 'pugin/cards/person', locals: { person: person }

        expect(rendered).to eq(<<DATA
<div class="card card-small">
  <h3>Jane Smith</h3>
  <p><strong>Minister for Tests</strong></p>
</div>
DATA
                            )
      end
    end
  end
end