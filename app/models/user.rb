class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :student
  
  # Validaciones_inicio
  validates :username, presence: true
  validates :username, format: { with: /\A\w+\Z/ }
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  
  validates_each :username do |record, attr, value|
  if value.start_with? '^''Ç''¨'':'';''_''`''+''-''.'','
    record.errors.add attr, 'no debe iniciar con caracteres especiales'
  end
end
  # Validaciones_fin
end
