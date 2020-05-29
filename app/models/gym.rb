class Gym < ApplicationRecord
  has_many :locations, dependent: :destroy
end
