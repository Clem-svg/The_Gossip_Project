class Tag < ApplicationRecord
  has_many :JoinTableTagGossips
  has_many :gossips, through: :JoinTableTagGossips

  validates :title, presence: true
end
