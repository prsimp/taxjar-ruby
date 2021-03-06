require 'helper'

describe Taxjar::Version do
  before do
    allow(Taxjar::Version).to receive(:major).and_return(1)
    allow(Taxjar::Version).to receive(:minor).and_return(2)
    allow(Taxjar::Version).to receive(:patch).and_return(3)
    allow(Taxjar::Version).to receive(:pre).and_return(nil)
  end

  describe '.to_h' do
    it 'returns a hash with the right values' do
      expect(Taxjar::Version.to_h).to be_a Hash
      expect(Taxjar::Version.to_h[:major]).to eq(1)
      expect(Taxjar::Version.to_h[:minor]).to eq(2)
      expect(Taxjar::Version.to_h[:patch]).to eq(3)
      expect(Taxjar::Version.to_h[:pre]).to eq(nil)
    end
  end

  describe '.to_a' do
    it 'returns an array with the right values' do
      expect(Taxjar::Version.to_a).to be_an Array
      expect(Taxjar::Version.to_a).to eq([1, 2, 3])
    end
  end

  describe '.to_s' do
    it 'returns a string with the right value' do
      expect(Taxjar::Version.to_s).to be_a String
      expect(Taxjar::Version.to_s).to eq('1.2.3')
    end
  end
end
