class Resident < ApplicationRecord
  belongs_to :society
  belongs_to :building
end
