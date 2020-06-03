class ContactMailer < ApplicationMailer

  def send_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      to:   'contact.email',
      subject: 'お問い合わせ通知'
    )
    # mail to: ENV['MAIL'], subject: "メールのタイトル"
  end
end
