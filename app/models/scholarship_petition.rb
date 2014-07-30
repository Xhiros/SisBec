class ScholarshipPetition < ActiveRecord::Base
  belongs_to :student
  
  def self.defState(status)
    if status
      return 'Aprobada'
    elsif status == nil
      return 'Pendiente'
    else
      return 'No aprobada'
    end
  end
end
