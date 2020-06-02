class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      to:   'test@example.com',
      subject: 'お問い合わせ通知'
    )
    # mail to: ENV['MAIL'], subject: "メールのタイトル"
  end
end
