class FeedbacksMailer < ApplicationMailer

  before_action :set_admin, only: :feedback_message

  def feedback_message(feedback)
    @feedback = feedback

    mail to: @admin.email,
         from: @feedback.user.email,
         subject: t('feedbacks_mailer.feedback_message.subject')
  end

  private

  def set_admin
    @admin = Admin.first
  end

end
