require_relative 'spec_helper'

describe Pugin do
  it 'is a module' do
    expect(Pugin).to be_a(Module)
  end

  it 'has a version' do
  	expect(Pugin::VERSION).not_to be_nil
  end

  it 'has an asset version' do
  	expect(Pugin::ASSET_VERSION).not_to be_nil
  end

  describe '#alternates' do
    context 'with no value set' do
      it 'returns an empty array' do
        expect(Pugin.alternates).to eq([])
      end
    end

    context 'with a value set' do
      before :each do
        Pugin.alternates = [{ type: 'text/foo', href: 'https://api.example.com/' }]
      end

      after :each do
        Pugin.alternates = nil
      end

      it 'returns the value' do
        expect(Pugin.alternates).to eq([{ type: 'text/foo', href: 'https://api.example.com/' }])
      end
    end
  end
end
