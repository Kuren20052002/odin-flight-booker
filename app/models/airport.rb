class Airport < ApplicationRecord
  validates :code, presence: :true, length: { is: 3 }
  validates_format_of :code, with: /^[A-Z]*$/, multiline: true
end
