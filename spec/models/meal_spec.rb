require 'rails_helper'

RSpec.describe Meal, type: :model do
  subject { described_class.new }
  subject {
    described_class.new(name: "Takoyaki Balls", description: "delicious mix of octupus and flour")
  }
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
