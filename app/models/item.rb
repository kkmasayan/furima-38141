class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :status_condition
  belongs_to :prefecture
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :shipping_day, optional: true

  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :description, :category_id, :shipping_charges_id, :shipping_days_id, :prefecture_id,
              :status_condition_id, :user_id
    validates :shipping_price_before_type_cast, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: ' is out of setting range' },
                                                format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id, :shipping_charges_id, :shipping_days_id, :prefecture_id, :status_condition_id
  end
end
