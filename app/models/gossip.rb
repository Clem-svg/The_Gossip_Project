class Gossip < ApplicationRecord
  belongs_to :user
  has_many :JoinTableTagGossips
  has_many :tags, through: :JoinTableTagGossips

  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true
end