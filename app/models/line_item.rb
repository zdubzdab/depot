class LineItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
    product.price
  end

  scope :needle_id, ->(i) { where("line_items.id = ?", i) }

end
