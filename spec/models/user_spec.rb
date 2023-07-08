require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new({ full_name: 'Tejiri', email: 'bimbo@gmail.com', password: 'qqqqqqqq', password_confirmation: 'qqqqqqqq' })
  end

  before { subject.save }

  it 'Full Name should be present' do
    subject.full_name = nil
    expect(subject).to_not be_valid
  end

  it 'password must always be present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'Password must have length greater than 6' do
    subject.password = 'qqqqq'
    expect(subject).to_not be_valid
  end
end
