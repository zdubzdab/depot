class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :line_items, through: :products
  has_many :orders, through: :line_items

  validates :name, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                    message: "correct email format: xxx@xxx.xxx" } ,
                    uniqueness: true
  validates :phone, presence: true,
                    numericality: true,
                    uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
