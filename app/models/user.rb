class User < ActiveRecord::Base
	has_many :messages, foreign_key: :sender_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_notification

  def send_notification
  	AdminMailer.new_user(self).deliver_now
  end

end
