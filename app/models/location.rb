class Location < ApplicationRecord
  belongs_to :gym
  has_many :comment
end
