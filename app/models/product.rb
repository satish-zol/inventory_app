class Product < ApplicationRecord
	before_destroy :not_referenced_by_any_line_item
	before_create :generate_serial_number
	default_scope {where.not(price: nil)}
	has_many :line_items

	validates :name, :brand, :price, :model, :purchased_at, :product_type, :strings, presence: true
  validates :price, numericality: { only_integer: true }, length: { maximum: 7 }

	def self.search(params)
		if params && params[:q].present?
			products = Product.where(serial_number: params[:q]).or(Product.where(name: params[:q])).or(Product.where(brand: params[:q])).or(Product.where(model:params[:q]))
		else
			products = Product.all
		end
	end

	private
	#random unique serial number after product save
	def generate_serial_number
    self.serial_number = SecureRandom.uuid 
    generate_serial_number if Product.find_by(serial_number: serial_number)
	end

	def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end
