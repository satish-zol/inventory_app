class Accessory < ApplicationRecord
	default_scope {where.not(price: nil)}
	has_many :line_items
end
