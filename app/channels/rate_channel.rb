class RateChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rate_channel"
    actual_rate = Rate.exists? ? Rate.last.actual : CurrencyRate.get_rate
    ActionCable.server.broadcast 'rate_channel', actual_rate
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
