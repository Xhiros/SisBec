class DocFile < ActiveRecord::Base
  belongs_to :student
  
  #Validaciones
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :docOwner, presence: true
  validates :name, :uniqueness => {:scope => :student_id}
  
  
  

  #Funciones para DocFile
  def self.correctionFile(docFile, student, fileUrl)#corrige el formulario original del archivo
    corrected = DocFile.new
    corrected.student_id = student.id
    corrected.name = docFile.name
    corrected.clarification = docFile.clarification
    corrected.docOwner = fileUrl + student.fileNumber + "/" + docFile.name + '.pdf'

    return corrected
  end
  def self.uploadFile(fileToUp, newName, fileNo, rootPath)
    begin
    fileName = fileToUp.original_filename;
    newPath = rootPath + fileNo + "/"
    if (Dir.glob newPath).length == 1
      #Si existe el directorio no hace falta hacer nada más
    else
      #Si no existe hay que crear la carpeta (debería faltar solo la del alumno)
      Dir.mkdir newPath
    end
    # Despues de verificar la existencia de la carpeta correspondiente
    
    path = File.join(newPath, fileName); #carga el archivo
    checkUpload = File.open(path, "wb") { |f| f.write(fileToUp.read) };   
    File.rename((newPath + fileName),(newPath + newName + '.pdf'))
    return checkUpload
    rescue
      return false
    end
  end
  
  def self.checkFiles(sourcePath)
    if (Dir.glob sourcePath).length == 1
      return true
    else
      return false
    end
  end
  
end
