json.array! @messages.each do |message|
	json.partial! "message.json.jbuilder", message: message
end