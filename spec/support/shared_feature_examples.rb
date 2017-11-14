shared_examples 'a simple pugin feature' do
  before :example do
    described_class.disable
  end

  after :example do
    described_class.disable
  end

  it 'is initially disabled' do
    expect(described_class.enabled?).to equal(false)
  end

  context 'without being altered' do
    it 'returns false when checked if it\'s enabled' do
      expect(described_class.enabled?).to equal(false)
    end
    it 'returns true when checked if it\'s disabled' do
      expect(described_class.disabled?).to equal(true)
    end
  end

  context 'when being enabled' do

    before :each do
      described_class.enable
    end

    it 'returns true when checked if it\'s enabled' do
      expect(described_class.enabled?).to equal(true)
    end
    it 'returns false when checked if it\'s disabled' do
      expect(described_class.disabled?).to equal(false)
    end
  end

  context 'when being disabled' do

    before :each do
      described_class.disable
    end

    it 'returns false when checked if it\'s enabled' do
      expect(described_class.enabled?).to equal(false)
    end
    it 'returns true when checked if it\'s disabled' do
      expect(described_class.disabled?).to equal(true)
    end
  end
end
