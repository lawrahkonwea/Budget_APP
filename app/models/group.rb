class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :transfers

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true, length: { maximum: 250 }
end
