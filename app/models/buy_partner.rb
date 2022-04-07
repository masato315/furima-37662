class BuyPartner
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Partner.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                   building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
