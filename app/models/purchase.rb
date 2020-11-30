class Purchase < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  has_one :item
  has_one :address
end
