class OrderShipping
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d+\z/, message: "Input only number"}, length: { maximum: 11 }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.create(token: token, user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
