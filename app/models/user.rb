class User < ApplicationRecord
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options uniqueness: true do
    validates :email
    end

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: '全角カナ文字を使用してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end

  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
