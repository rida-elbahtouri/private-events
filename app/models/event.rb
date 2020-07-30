class Event < ApplicationRecord
    has_many :guests,foreign_key: :attended_event_id
    has_many :attendees ,through: :guests
    belongs_to :creator ,class_name: "User"
end