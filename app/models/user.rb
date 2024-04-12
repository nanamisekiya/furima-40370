class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字混合で入力してください' }
end
