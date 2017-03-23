class SessionsController < ApplicationController
  def new
  end

  def create
  	employer = Employer.find_by(email: params[:session][:email].downcase)
    if employer && Employer.find_by(phone: params[:session][:phone])
    	log_in employer
      redirect_to employer
    else
      flash[:danger] = 'Invalid email/phone combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
