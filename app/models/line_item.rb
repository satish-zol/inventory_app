class LineItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :accessory, optional: true
  belongs_to :cart, optional: true

  def total_price
  	if accessory.nil?
  		product_price = product.price.to_i * quantity.to_i
  		product_price ||= 0
  	end
  	if product.nil?
  		accessory_price = accessory.price.to_i * quantity.to_i
  		accessory_price ||= 0
  	end
  	
  	total_price = product_price.to_i + accessory_price.to_i
  end
end
