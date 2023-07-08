class Society < ApplicationRecord
  has_many :buildings
  has_many :residents
end
