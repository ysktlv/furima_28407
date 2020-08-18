class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :house_number, :building_number, :phone_number

  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/.freeze

  validates :city, :house_number, presence: true
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX, message: "はハイフンを含めてください" }
  validates :prefecture, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX, message: "はハイフンを含まない11桁以内で入力してください" }

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, item_id: item_id, user_id: user_id)
  end
end
