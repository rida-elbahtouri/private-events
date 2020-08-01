class User < ApplicationRecord
  has_many :guests, foreign_key: :attendee_id
  has_many :attended_events, through: :guests
  has_many :hosted_events, class_name: 'Event', foreign_key: 'creator_id'

  validates :name, presence: true
end
