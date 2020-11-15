class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birthday, presence: true
  validate :password_complexity

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /\A(?=.*?[A-Za-z])(?=.*\d)[A-Za-z\d]/

    errors.add :password, 'Encrypted password is invalid'
  end
end
