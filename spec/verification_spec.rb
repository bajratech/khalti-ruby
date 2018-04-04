# frozen_string_literal: true

RSpec.describe Khalti do
  it 'has verify method in verification class' do
    expect(Khalti::Verification).to respond_to(:verify).with(2).arguments
  end

  context 'Transaction verification' do
    before do
      stub_request(:post, 'https://khalti.com/api/payment/verify/')
        .to_return(
          body: fixture('verify.json'),
          status: 200,
          headers: { 'content-type': 'application/json' }
        )
    end

    it 'should call verify method in verification class' do
      resp = Khalti::Verification.verify('token_token_token_token', 1000)
      expect(resp).to eq JSON.parse(fixture('verify.json').read)
    end
  end
end
