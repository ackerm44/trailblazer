class User < ApplicationRecord
  has_many :trails
  has_many :lists
  has_many :regions, through: :trails
  has_many :questions
  has_many :tips

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
