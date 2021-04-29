module EventsHelper
	def attend_status(event)
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
