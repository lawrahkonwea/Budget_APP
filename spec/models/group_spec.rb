require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:first_user) { User.create(full_name: 'Tejiri', email: 'bimbo@gmail.com', password: 'qqqqqqqq') }
  let(:first_group) { Group.new(name: 'Makeup Kit', icon: 'https://w7.pngwing.com/pngs/542/1010/png-transparent-cosmetics-makeup-brush-lipstick-makeup-brush-miscellaneous-pencil-people-thumbnail.png', user_id: first_user.id) }

  context 'validation tests' do
    it 'should not be valid without a name' do
      first_group.name = nil
      expect(first_group).to_not be_valid
    end

    it 'should not be valid without an icon' do
      first_group.icon = nil
      expect(first_group).to_not be_valid
    end

    it 'must have a valid user_id' do
      first_group.user_id = nil
      expect(first_group).to_not be_valid
    end
  end
end
