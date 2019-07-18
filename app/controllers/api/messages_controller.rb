class Api::MessagesController < ApplicationController

	def index
		@messages = Message.all.order(created_at: :desc)
		render "index.json.jbuilder"
	end

	def create
    @message = Message.new(
      user_id: current_user.id,
      body: params[:body]
    )
    @message.save

    ActionCable.server.broadcast "messages_channel", {
      id: @message.id,
      name: @message.user.name,
      body: @message.body,
      created_at: @message.created_at
    }
    
    render "show.json.jbuilder"
  end
end
