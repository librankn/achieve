class RecordMailer < ApplicationMailer
  def contact_mail(record)
    @record = record
    email = @record.user.email

    mail to: email, subject: "ブログ作成完了しました"
  end
end
