RSpec.describe Khalti do
  let(:transaction) {Khalti::Transaction.new}
  let(:verification) {Khalti::Verification.new}

  it "has a version number" do
    expect(Khalti::VERSION).not_to be nil
  end

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
