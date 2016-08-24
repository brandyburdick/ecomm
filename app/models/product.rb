class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :quantity, numericality: {greater_than_or_equal_to: 0}
	validates_format_of :price, with: /\A\d+\.?\d{0,2}\z/
	validates :description, presence: true
end
