class Material < ApplicationRecord
  belongs_to :project

  validates :name, inclusion: {in: ['cement', 'bajri', 'sand', 'brick']}

  MATERIAL_OPTIONS = [['cement', 'cement'],
  ['bajri', 'bajri'],
  ['sand', 'sand'],
  ['brick', 'brick']]
end
