class Building < ApplicationRecord
  belongs_to :society
  has_many :residents
end
