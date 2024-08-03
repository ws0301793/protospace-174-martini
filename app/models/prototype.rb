class Prototype < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
