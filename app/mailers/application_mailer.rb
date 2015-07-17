class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def post_mail(headers, plain: nil, html: nil)
    mail headers do |format|
      format.text { render plain: plain } if plain.present?
      format.html { render html: html.html_safe } if html.present?
    end
  end
end
