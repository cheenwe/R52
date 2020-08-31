class SyInfoJob < ApplicationJob

  # SyInfoJob.perform_later(data)
  def perform(data)
  	p ">>"*30
  	p data
  	p ">>"*30

    # info = Sy::Info.create(service_id: service_id, state: state, send_at:Time.now, reason: reason)
    # History.create(data)
    # Do something later
  end
end
