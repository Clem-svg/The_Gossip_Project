class Gossip < ApplicationRecord
  belongs_to :user
  has_many :JoinTableTagGossips
  has_many :tags, through: :JoinTableTagGossips
end
