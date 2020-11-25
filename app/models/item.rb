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
    validates :image
    validates :title
    validates :text

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :genre_id
      validates :condition_id
      validates :postage_id
      validates :prefecture_id
      validates :schedule_id
    end

    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  end
end
