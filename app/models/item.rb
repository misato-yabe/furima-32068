class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :price
  end

  validates :genre_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :schedule_id, numericality: { other_than: 1 }
end
