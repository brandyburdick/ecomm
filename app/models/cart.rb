class Cart < ActiveRecord::Base
  validates :user, presence: true
  belongs_to :user

  def subtotal
    line_items.to_a.sum { |item| item.total_price }
  end
  
end
