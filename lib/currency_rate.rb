class CurrencyRate
  def self.get_rate
    JSON.parse(get_rate_json)["Valute"]["USD"]["Value"]
  end

  private

  def self.get_rate_json
    get_rate_json ||= Net::HTTP.get(URI "https://www.cbr-xml-daily.ru/daily_json.js")
  end
end
