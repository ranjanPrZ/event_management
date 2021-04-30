module EventsHelper
	def attend_status(event)
  	user_ids = EventUser.event_users(event.id,current_user.id).pluck(:user_id)
  	if user_ids.include?(current_user.id)
  	  flash[:alert]="You have already subscribed to attend the event."
	  end
    event.users.pluck(:name).include?(current_user.name) ? 'Attend' : 'UnAttend'
	end

	def attendees_count(event_details)
  	event_details[:users].present? ? event_details[:users].length : 0
	end

	def flash_key_cls(flash)
  keys = flash.keys
  keys_clas = keys.length>0 ? [keys.first, keys.first=="success" ? "success" : "danger"] : []
  return [keys_clas.first, keys_clas.last]
	end
end
