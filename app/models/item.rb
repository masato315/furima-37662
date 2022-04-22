class Item < ApplicationRecord
  validates :image, presence: true
  validates :goods_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1}
  validates :condition_id, numericality: { other_than: 1}
  validates :delivery_id, numericality: { other_than: 1}
  validates :prefecture_id, numericality: { other_than: 1}
  validates :shipping_day_id, numericality: { other_than: 1}
  validates :price, presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one :buy
end
