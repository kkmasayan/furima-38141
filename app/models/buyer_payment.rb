class BuyerPayment
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :address, :building_name, :tell_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number,
              format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id
    validates :city
    validates :address
    validates :tell_number
    validates :token
  end
  validates :tell_number, numericality: { with: true, message: 'is invalid. Input only number' }
  validates :tell_number, length: { minimum: 10, maximum: 11 }

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Payment.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, tell_number: tell_number, buyer_id: buyer.id)
  end
end
