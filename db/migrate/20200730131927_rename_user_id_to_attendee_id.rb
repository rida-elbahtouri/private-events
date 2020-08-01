class RenameUserIdToAttendeeId < ActiveRecord::Migration[6.0]
  def change
    rename_column :guests, :user_id, :attendee_id
    rename_column :guests, :event_id, :attended_event_id
  end
end
