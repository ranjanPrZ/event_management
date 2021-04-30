class EventUser < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :event_users,->(event_id,user_id){where(event_id:event_id, user_id:user_id)}
end
