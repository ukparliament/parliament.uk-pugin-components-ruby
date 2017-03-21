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
end
