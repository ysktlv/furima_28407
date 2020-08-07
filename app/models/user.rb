class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birth_date, presence: true
  password_format = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, format: { with:password_format, message: "は英字と数字の両方を含めて設定してください" }
  name_format = /\A[ぁ-んァ-ン一-龥]+\z/
  validates :last_name, :first_name, presence: true, format: { with: name_format, message: "は全角文字を使用してください" }
  name_reading_format = /\A[ァ-ン]+\z/
  validates :last_name_reading, :first_name_reading, presence: true, format: { with: name_reading_format, message: "は全角カナを使用してください" }
end
