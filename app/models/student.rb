class Student < ActiveRecord::Base
  # Relaciones
  belongs_to :user
  
  # Validaciones
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :dni, presence: true
  validates :career, presence: true
  validates :fileNumber, presence: true
  validates :address, presence: true
  validates :department, presence: true
  validates :user_id, uniqueness: true
  validates :familyGroup, presence: true
  
  # Funciones
  def self.checkStudent(id)#checkea que el usuario tenga un perfil de alumno creado
    return ( Student.where(user_id: id).count == 1 ? true : false )
  end
  def self.countFamily(student)#Cuenta cuantos familiares faltan cargar
    return (student.familyGroup - Family.where(student_id: student.id).count)    
  end
end