class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :info, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, message: 'Half-width number'}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :product_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
end
