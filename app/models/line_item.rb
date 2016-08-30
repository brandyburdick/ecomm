class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :cart, presence: true
  validates :product, presence: true

  def total_price
    product.price * quantity
  end
end
