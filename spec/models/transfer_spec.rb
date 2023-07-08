require 'rails_helper'

RSpec.describe Transfer, type: :model do
  let(:first_user) { User.create(full_name: 'Tejiri', email: 'bimbo@gmail.com', password: 'qqqqqqqq') }
  let!(:first_group) { Group.create(name: 'Makeup Kit', icon: 'https://w7.pngwing.com/pngs/542/1010/png-transparent-cosmetics-makeup-brush-lipstick-makeup-brush-miscellaneous-pencil-people-thumbnail.png', user_id: first_user.id) }
  let(:transfer) { Transfer.new(name: 'Blush', amount: 3.0, author_id: first_user.id) }

  context 'validation tests' do
    it 'should not be valid without a name' do
      transfer.name = nil
      expect(transfer).to_not be_valid
    end

    it 'should not be valid without an amount' do
      transfer.amount = nil
      expect(transfer).to_not be_valid
    end

    it 'amount must be a number and nothing else' do
      transfer.amount = 'makeup'
      expect(transfer).to_not be_valid
    end

    it 'must have a valid author ID' do
      transfer.author_id = nil
      expect(transfer).to_not be_valid
    end
  end
end
