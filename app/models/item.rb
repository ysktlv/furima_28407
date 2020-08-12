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

  validates :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_days_id, numericality: { other_than: 1 } 
end
