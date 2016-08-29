class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :cart, presence: true
  validates :product, presence: true
end
