class AccountActivationsController < ApplicationController
	
	def edit
    employer = Employer.find_by(email: params[:email])
    if employer && !employer.activated? 
      employer.update_attribute(:activated,    true)
      log_in employer
      flash[:success] = "Account activated!"
      redirect_to employer
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
