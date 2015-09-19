class Recipient < ActiveRecord::Base
	belongs_to :message
	belongs_to :user

	validates :user_id, presence: true

	after_create :send_recipient_notification

	def send_recipient_notification
		RecipientMailer.recipient_message(user, message).deliver_now
	end
end
