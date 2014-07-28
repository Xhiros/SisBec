class LuchPetition < ActiveRecord::Base
  belongs_to :student
  
  #Funciones
  def self.consultar(ident)
    user = User.find(ident)
    return user.username
  end
end
