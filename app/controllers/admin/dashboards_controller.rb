module Admin
  class DashboardsController < Administrate::ApplicationController
    def dashboards

    end

    def index
        today_buy_cart = Cart.where(done: true, updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
        @today_profit = today_buy_cart.sum{|cart|
            cart.cart_items.sum{|i| (i[:quantity] * i[:price_cents])}
        }

        @month_buy_cart = Cart.where(done: true, updated_at: Time.zone.now.all_month)

        @month_profit = @month_buy_cart.sum{|cart|
          cart.cart_items.sum{|i| (i[:quantity] * i[:price_cents]) }
        }

        @user_count = User.count
    end
  end
end
