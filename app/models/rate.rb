class Rate < ApplicationRecord

  before_create :set_timeout

  def actual
    expired? ? CurrencyRate.get_rate : value
  end

  def expired?
    Time.now >= expired_date
  end

  private

  def set_timeout
    self.jid = RateWorker.perform_at(expired_date.to_time)
  end
end
