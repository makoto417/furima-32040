class OrderAddress
  include ActiveModel::ActiveModel
  attr_accessor :user, :item, :postcode, :prefectures, :address_city, :address_line1, :address_line2, :phone_number, :order

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :address_city
    validates :address_line1
    validates :phone_number, length: {maximum: 11}, numericality: { only_integer: true }
  end

  def save
    order = Order.create(user_id: user.id, item_id: item.id)
    Address.create(postcode: postcode, prefectures_id: prefecture_id, address_city: address_city, address_line1: address_line1, address_line2: address_line2, phone_number: phone_number, order_id: order.id)

  end
end