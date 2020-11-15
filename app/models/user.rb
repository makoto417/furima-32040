class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birthday
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :family_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end
  
  validate :password_complexity

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /\A(?=.*?[A-Za-z])(?=.*\d)[A-Za-z\d]/

    errors.add :password, 'Encrypted password is invalid'
  end
end
