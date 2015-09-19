class RecipientMailer < ActionMailer::Base

	def recipient_message(user, message)
		@user = user
		@message = message

		mail(to: user.email,
			from: "no-reply@gmail.com",
			subject: "New Project!"
			)
	end

end