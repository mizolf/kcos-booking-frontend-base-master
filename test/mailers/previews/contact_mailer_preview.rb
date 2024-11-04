class ContactMessageMailerPreview < ActionMailer::Preview

  def send_message
    contact_message = ContactMessage.new(full_name: "Justin Case", email: "justin.case@gmail.com", message: "Lorem brate Ipsum, spiritus santus! Forecast for today is a lot of sunshine above the thick clouds. From Justin with love! Have a nice coding :)", created_at: DateTime.now)
    ContactMailer.send_message(contact_message)
  end

end