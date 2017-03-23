class EmployerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employer_mailer.account_activation.subject
  #
  def account_activation(employer)
  	@employer = employer
    mail to: employer.email, subject: "Account activation"
  end
end
