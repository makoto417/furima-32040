class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postcode, :prefectures_id, :address_city, :address_line1, :address_line2, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :address_city
    validates :address_line1
    validates :phone_number, length: { maximum: 11 }, numericality: { only_integer: true }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefectures_id: prefectures_id, address_city: address_city, address_line1: address_line1, address_line2: address_line2, phone_number: phone_number, order_id: order.id)
  end
end
