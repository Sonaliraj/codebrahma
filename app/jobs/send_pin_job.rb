class SendPinJob < ActiveJob::Base
  queue_as :default

  def perform(employer)
    nexmo = Nexmo::Client.new(key: ENV["499c8d42"], secret: ENV["d7025594fb6f5afa"])
    resp = nexmo.send_2fa_message(to: employer.phone, pin: employer.pin)
  end
end
