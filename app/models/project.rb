class Project < ApplicationRecord
  has_many :materials
  has_many :labours
end