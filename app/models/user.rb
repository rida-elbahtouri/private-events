class User < ApplicationRecord
  has_many :guests
  has_many :events ,through: :guests
  has_many :hosted_events, class_name: "Event", foreign_key: "creator_id"

  validates :name, presence: true
end
