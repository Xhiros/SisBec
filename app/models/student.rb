class Student < ActiveRecord::Base
  # Relaciones
  belongs_to :user
  
  # Validaciones
  
  # Funciones
  def self.checkStudent(id)
    return ( Student.where(user_id: id).count == 1 ? true : false )
  end
end
