class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  belongs_to :user
  has_one :order
  has_one :address
  has_one_attached :image

  validates :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_days_id, numericality: { other_than: 1, message: "を入力してください" } 
  validates :image, :name, :text, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_days_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は300~9,999,999円の範囲で設定してください" }
end
