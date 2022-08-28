require 'rails_helper'

RSpec.describe SessionType, type: :model do
  subject do
    SessionType.new(
      name: 'Workshop',
      description: 'Stuf about a workshop',
      order_by: 10,
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without a name' do
    subject.name = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an order_by' do
    subject.order_by = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:order_by]).to include("can't be blank")
  end

  it 'is invalid with duplicate names' do
    session_type_1 = FactoryBot.create(:session_type, name: 'name-1') 
    session_type_2 = FactoryBot.build(:session_type, name: 'name-1') 

    session_type_2.save

    expect(session_type_2.valid?).to be false
    expect(session_type_2.errors[:order_by]).to include("has already been taken")
  end

end
