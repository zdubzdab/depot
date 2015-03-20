class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user

  validates :name, :address, :email, :phone, presence: true,
            length: { minimum: 3, maximum: 25}
  validates :phone, numericality: { only_integer: true }
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end

