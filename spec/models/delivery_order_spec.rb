require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  subject { described_class.new }
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with valid attributes" do
    subject.serving_datetime = '2017-10-20'
    subject.order_id = 'G0009'
    expect(subject).to be_valid
  end
  it "is not valid without a serving_datetime" do
    expect(subject).to_not be_valid
  end
  it "is not valid without a order_id" do
    subject.serving_datetime = '2017-10-20'
    expect(subject).to_not be_valid
  end
end
