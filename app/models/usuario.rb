class Usuario < ActiveRecord::Base
  validates :nombre, presence: true, uniqueness: true
  has_secure_password
end
