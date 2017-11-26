require 'rails_helper'
RSpec.describe OrderItem, type: :model do
  let(:order1) { DeliveryOrder.create(serving_datetime: "2017-10-20", order_id: "G0009") }
  let(:meal1) { Meal.create(name: "Takoyaki Balls", description: "delicious mix of octupus and flour") }
  subject { described_class.new }
  subject {
    described_class.new(delivery_order_id: order1.id, meal_id: meal1.id, quantity: 60, unit_price: 100)
  }
  # pending "add some examples to (or delete) #{__FILE__}"
describe "Validations" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a delivery_order_id" do
    subject.delivery_order_id = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a meal_id" do
    subject.meal_id = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a quantity" do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a unit_price" do
    subject.unit_price = nil
    expect(subject).to_not be_valid
  end
end
  describe "Associations" do
    it "belongs to meal" do
      assc = described_class.reflect_on_association(:meal)
      expect(assc.macro).to eq :belongs_to
    end
    it "belongs to delivery_order" do
      assc = described_class.reflect_on_association(:delivery_order)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
