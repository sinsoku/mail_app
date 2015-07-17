class Envelope
  include ActiveModel::Model

  attr_accessor :from, :to, :subject, :plain, :html

  validates :from, presence: true
  validates :to, presence: true
  validates :subject, presence: true
  validates :plain, presence: true

  def headers
    {from: from, to: to, subject: subject}
  end

  def save
    if valid?
      ApplicationMailer.post_mail(headers, plain: plain, html: html).deliver_later
      true
    else
      false
    end
  end
end
