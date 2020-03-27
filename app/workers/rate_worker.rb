class RateWorker
  include Sidekiq::Worker

  def perform
    ActionCable.server.broadcast 'rate_channel', Rate.last.actual
  end
end
