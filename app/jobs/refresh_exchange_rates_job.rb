class RefreshExchangeRatesJob < ApplicationJob
  queue_as :default

  def perform
    ExchangeRateService.refresh_rates!
  end
end
