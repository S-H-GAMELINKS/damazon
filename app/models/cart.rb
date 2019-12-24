class Cart < ApplicationRecord
  belongs_to :user
  acts_as_shopping_cart_using :cart_item

  def self.get_active_cart
    find_by done: false
  end
end
