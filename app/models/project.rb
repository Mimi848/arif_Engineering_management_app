class Project < ApplicationRecord
  has_many :materials, dependent: :delete_all
  has_many :labours, dependent: :delete_all
end
