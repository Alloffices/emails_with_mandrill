module MessagesHelper
  def recipients_options(chosen_recipient)
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id} #{'selected' if user = chosen_recipient} > #{user.username}</option>"
    end
    s.html_safe
  end
end