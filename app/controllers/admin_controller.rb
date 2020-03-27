class AdminController < ApplicationController

  def index
    @rate = Rate.new Rate.last.as_json(only: [:value, :expired_date])
  end

  def set_currency
    Sidekiq::ScheduledSet.new.find_job(Rate.last&.jid)&.delete
    rate = Rate.create(permitted)
    ActionCable.server.broadcast 'rate_channel', rate.actual
  end

  private

  def permitted
    params.require(:rate).permit :value, :expired_date
  end
end
