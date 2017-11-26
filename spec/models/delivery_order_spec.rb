require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  subject { described_class.new }
  subject {
    described_class.new(serving_datetime: "2017-10-20", order_id: "G0009")
  }
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a serving_datetime" do
    subject.serving_datetime = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a order_id" do
    subject.order_id = nil
    expect(subject).to_not be_valid
  end
end
