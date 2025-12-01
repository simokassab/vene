module Montypay
  class Client
    Result = Data.define(:success?)

    def initialize(order)
      @order = order
    end

    def start_payment
      # TODO: Integrate MontyPay API here. Prepare payload with @order totals & customer info.
      # For now we simulate a successful redirect/charge.
      Result.new(true)
    end
  end
end
