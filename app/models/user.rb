class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_NAME_READING_REGEX = /\A[ァ-ン]+\z/
  
  validates :nickname, :birth_date,
    presence: true
  validates :password,
    format: { with: VALID_PASSWORD_REGEX, message: "は英字と数字の両方を含めて設定してください" }
  validates :last_name, :first_name,
    presence: true,
    format: { with: VALID_NAME_REGEX, message: "は全角文字を使用してください" }
  validates :last_name_reading, :first_name_reading,
    presence: true,
    format: { with: VALID_NAME_READING_REGEX, message: "は全角カナを使用してください" }
end
