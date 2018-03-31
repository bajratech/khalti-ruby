RSpec.describe Khalti do

  it "has a version number" do
    expect(Khalti::VERSION).not_to be nil
  end

  context 'Class existance test' do
    let(:transaction) {Khalti::Transaction.new}
    let(:verification) {Khalti::Verification.new}

    it "has transaction class" do
      expect(transaction).to be_a Khalti::Transaction
    end

    it "has all method in transaction class" do
      expect(Khalti::Transaction).to respond_to(:all)
    end

    it "has find method in transaction class" do
      expect(Khalti::Transaction).to respond_to(:find).with(1).argument
    end

    it "has verification class" do
      expect(verification).to be_a Khalti::Verification
    end

    it "has verify method in verification class" do
      expect(Khalti::Verification).to respond_to(:verify).with(2).arguments
    end
  end

  context 'Transaction verification' do
    before do
      stub_request(:post, "https://khalti.com/api/payment/verify/").to_return(:body => fixture("verify.json"),
        :status => 200,
        :headers => {})
    end
    it "should call verify method in verification class" do
      resp = Khalti::Verification.verify("token", "amount")
      expect(resp).to eq JSON.parse(fixture("verify.json").read)
    end
  end

  context 'Transaction list and find' do
    before do
      stub_request(:get, "https://khalti.com/api/merchant-transaction/").to_return(:body => fixture("trans_all.json"),
        :status => 200,
        :headers => {})
      stub_request(:get, "https://khalti.com/api/merchant-transaction/idx/").to_return(:body => fixture("tran.json"),
      :status => 200,
      :headers => {})
    end
    it "should call all method in transaction class" do
      resp = Khalti::Transaction.all
      expect(resp).to eq JSON.parse(fixture("trans_all.json").read)
    end
    it "should call find method in transaction class" do
      resp = Khalti::Transaction.find("idx")
      expect(resp).to eq JSON.parse(fixture("tran.json").read)
    end
  end
end
