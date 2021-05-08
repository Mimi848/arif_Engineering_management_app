class Material < ApplicationRecord
  belongs_to :project

  validates :name, inclusion: {in: ['سیمنٹ', 'سٹیل','بجری', 'ریت', 'اینٹ','دیگر مواد']}

  MATERIAL_OPTIONS = [
  ['سیمنٹ', 'سیمنٹ'],
  ['بجری', 'بجری'],
  ['ریت', 'ریت'],
  ['سٹیل', 'سٹیل'],
  ['اینٹ', 'اینٹ'],
  ['دیگر مواد','دیگر مواد'],
  ]
end
