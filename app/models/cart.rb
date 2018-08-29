class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_product(item)
		if item.is_a?(Product)
			current_item = line_items.find_by(product_id: item.id)
		end
		if item.is_a?(Accessory)
			current_item = line_items.find_by(accessory_id: item.id)
		end
		if current_item
			current_item.increment(:quantity)
		else
			current_item = line_items.build(product_id: item.id) if item.is_a?(Product)
			current_item = line_items.build(accessory_id: item.id) if item.is_a?(Accessory)
		end
		current_item
	end

	def total_price
		line_items.to_a.sum{|item| item.total_price}
	end

end
