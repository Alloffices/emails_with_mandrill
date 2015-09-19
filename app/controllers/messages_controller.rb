class MessagesController < ApplicationController
	before_action :authenticate_user!

	def new
		@message = Message.new
		@chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
		@user = User.find_by(id: params[:user])
	end

	def create
		@message = current_user.messages.build(message_params)
		if @message.save

			MessageMailer.message_created(@user).deliver_now

			flash[:success] = "Message Sent!"
			redirect_to root_path
		else
			flash[:alert] = "Nothing Happend!"
			render 'new'
		end
	end

	def index
		@messages = Recipient.where(:user_id => current_user.id).order('created_at DESC')
	end


	private

	def message_params
		params.require(:message).permit(:title, :description, :budget, :location, :date, :start_time, :end_time, :skill, :sender_id, user_tokens: [])
	end

end
