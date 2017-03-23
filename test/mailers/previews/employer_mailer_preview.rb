# Preview all emails at http://localhost:3000/rails/mailers/employer_mailer
class EmployerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employer_mailer/account_activation
  def account_activation
    EmployerMailer.account_activation
  end

end
