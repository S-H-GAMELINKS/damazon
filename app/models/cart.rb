class Cart < ApplicationRecord
  belongs_to :user
  acts_as_shopping_cart_using :cart_item
end