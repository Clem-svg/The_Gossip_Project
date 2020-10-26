class Tag < ApplicationRecord
  has_many :JoinTableTagGossips
  has_many :gossips, through: :JoinTableTagGossips
end
