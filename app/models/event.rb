class Event < ApplicationRecord
    has_many :guests
    has_many :users ,through: :guests
    belongs_to :creator ,class_name: "User"
end