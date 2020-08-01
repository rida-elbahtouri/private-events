class AddIndexToGuests < ActiveRecord::Migration[6.0]
  def change
    add_index :guests, :attendee_id
    add_index :guests, :attended_event_id
  end
end
