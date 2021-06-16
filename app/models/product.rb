class Product < ActiveRecord::Base
  has_many :marks, dependent: :destroy
  validates :title, presence: true, length: {maximum: 250}
  validates :description, presence: true, length: {maximum: 500}
end
