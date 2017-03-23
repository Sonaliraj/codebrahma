class Employer < ActiveRecord::Base
	include ActiveModel::Dirty
	attr_accessor :remember_token, :activation_token
	after_save :send_pin!, if: "phone_changed?"
  before_save   :downcase_email
  before_create :create_activation_digest
	validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 9, :maximum => 15 }
  
  private
	  def downcase_email
	    self.email = email.downcase
	  end

	  def Employer.new_token
	    SecureRandom.urlsafe_base64
	  end

	    # Creates and assigns the activation token and digest.
	  def create_activation_digest
	    self.activation_token  = Employer.new_token
	    # self.activation_digest = User.digest(activation_token)
	  end

	  def reset_pin!
	    self.update_column(:pin, rand(1000..9999))
		end

		def unverify!
		  self.update_column(:verified, false)
		end

		def send_pin!
		  reset_pin!
		  unverify!
		  SendPinJob.perform_later(self)
		end
end
