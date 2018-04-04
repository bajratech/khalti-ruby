# frozen_string_literal: true

RSpec.describe Khalti do
  it 'has all method in transaction class' do
    expect(Khalti::Transaction).to respond_to(:all)
  end

  it 'has find method in transaction class' do
    expect(Khalti::Transaction).to respond_to(:find).with(1).argument
  end

  context 'Transaction list and find' do
    before do
      stub_request(:get, 'https://khalti.com/api/merchant-transaction/')
        .to_return(
          body: fixture('trans_all.json'), status: 200,
          headers: { 'content-type': 'application/json' }
        )
      stub_request(:get, 'https://khalti.com/api/merchant-transaction/idx/')
        .to_return(
          body: fixture('tran.json'), status: 200,
          headers: { 'content-type': 'application/json' }
        )
    end

    it 'should call all method in transaction class' do
      resp = Khalti::Transaction.all
      expect(resp).to eq JSON.parse(fixture('trans_all.json').read)
    end

    it 'should call find method in transaction class' do
      resp = Khalti::Transaction.find('idx')
      expect(resp).to eq JSON.parse(fixture('tran.json').read)
    end
  end
end
