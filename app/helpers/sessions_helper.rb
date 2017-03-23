module SessionsHelper

	def log_in(employer)
    session[:employer_id] = employer.id
  end

  def current_employer
    @current_employer ||= Employer.find_by(id: session[:employer_id])
  end

  def logged_in?
    !current_employer.nil?
  end

  def log_out
    session.delete(:employer_id)
    @current_employer = nil
  end
end
