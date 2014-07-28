class Family < ActiveRecord::Base
  belongs_to :student

  # Validaciones
  validates :name, presence: true
  validates :dni, presence: true
  validates :relationship, presence: true
  validates :student_id, presence: true

end