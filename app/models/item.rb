class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :days_id
    validates :price
  end
end
