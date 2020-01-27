module Admin
  class DashboardsController < Administrate::ApplicationController
    def dashboards

    end

    def index
        today_buy_cart = Cart.where(done: true, updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
        @today_profit = today_buy_cart.map{|cart|
            cart.cart_items.sum{|i| (i[:quantity] * i[:price_cents])}
        }
    end
  end
end
