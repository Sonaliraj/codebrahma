class VerifyController < ApplicationController
	skip_before_filter :redirect_if_unverified

  # GET /verify
  def new
  end

  # POST /verify
  def create
    current_employer.send_pin!
    redirect_to new_verify_url, notice: "A PIN number has been sent to your phone"
  end
end
