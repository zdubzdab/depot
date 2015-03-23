class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :line_items, through: :products
  has_many :orders, through: :line_items

  validates :name, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
