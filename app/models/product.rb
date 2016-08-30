class Product < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :name, presence: true
	validates :quantity, numericality: {greater_than_or_equal_to: 0}
	validates_format_of :price, with: /\A\d+\.?\d{0,2}\z/
	validates :description, presence: true
	
	def self.promoted
	    where(promoted: true)
	end

	private
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items Present')
				return false
			end
		end

end
