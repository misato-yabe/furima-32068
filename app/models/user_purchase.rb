class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :tell, :token, :price

  with_options presence: true do
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/,message:"Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :block
    validates :tell, format: {with: /\A[a-zA-Z0-9]+\z/,message:"Phone number Input only number"}
    validates :token, presence: true
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id:item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, tell:tell, user_id: user_id)
  end
end