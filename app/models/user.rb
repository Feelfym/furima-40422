class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' }
    validates :last_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' }
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'パスワードには英字と数字の両方を含めてください'
end
