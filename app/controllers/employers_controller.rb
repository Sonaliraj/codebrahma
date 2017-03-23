class EmployersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def index
    @employers = Employer.all
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      log_in  @employer
      EmployerMailer.account_activation(@employer).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
    	render 'new'
    end
  end

	def show
    @employer = Employer.find(params[:id])
	end

  def edit
    @employer = Employer.find(params[:id])
  end

  def update
    @employer = Employer.find(params[:id])
    current_email = @employer.email
    if @employer.update_attributes(employer_params)
      if current_email != params[:employer][:email]
        @employer.update_attribute(:activated, false)
        EmployerMailer.account_activation(@employer).deliver_now
      end
      flash[:success] = "Employee updated"
      redirect_to employers_path
    else 
      flash[:success] = "#{@employer.name} has been updated successfully"
      render 'edit'
    end
  end

  # def send_notification(employer)
  #   employer = Employer.find_by(email: params[:email])
  #   if employer && employer.activated? 
  #     employer.update_attribute(:activated,    false)
  #   end
  # end

  private
    
    def employer_params
      params.require(:employer).permit(:name, :email, :dateofbirth, :gender, :location, :phone, :activation_digest, :activated, :pin, :verified)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end

