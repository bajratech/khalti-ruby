# frozen_string_literal: true

RSpec.describe Khalti do
  it 'has a version number' do
    expect(Khalti::VERSION).not_to be nil
  end

  context 'class existance test' do
    let(:transaction) { Khalti::Transaction.new }
    let(:verification) { Khalti::Verification.new }

    it 'has transaction class' do
      expect(transaction).to be_a Khalti::Transaction
    end

    it 'has verification class' do
      expect(verification).to be_a Khalti::Verification
    end
  end
end
