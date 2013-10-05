class Ponencia < ActiveRecord::Base
  validates :titulo, presence: true, uniqueness: true
  validates :expositor, presence: true
end
