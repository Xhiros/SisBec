class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
    

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    
    respond_to do |format|
      if !current_user.admin
        format.html { redirect_to root_url, notice: 'Acceso denegado.' }
        #format.json { render action: 'root', status: :created, location: @student }
      else
        format.html { render action: 'index' }
        #format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @count = Student.countFamily(@student)
    #Si no coincide el id del usuario logueado con el del alumno que quiere ver lo saca de la pagina
    #Evita que otros usuarios vean los datos de los demas
    #Solo los usuarios "admin" pueden ver y editar otros usuarios
    respond_to do |format| 
      if current_user.admin || (current_user.student.id != @student.id)
        format.html { redirect_to root_url, notice: 'Acceso denegado.' }
        #format.json { render action: 'root', status: :created, location: @student }
      else
        format.html { render action: 'show' }
        #format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    #Si no coincide el id del usuario logueado con el del alumno que quiere ver lo saca de la pagina
    #Evita que otros usuarios modifiquen los datos de los demas
    respond_to do |format| 
      if current_user.admin || (current_user.student.id != @student.id)
        format.html { redirect_to root_url, notice: 'Acceso denegado.' }
        #format.json { render action: 'root', status: :created, location: @student }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @student.user_id = current_user.id

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Estudiante ha sido satisfactoriamente creado.' }
        format.json { render action: 'show', status: :created, location: @student }
      else
        format.html { render action: 'new' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Estudiante ha sido satisfactoriamente actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.delete
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:firstName, :lastName, :dni, :career, :otherCareer, :fileNumber, :address, :department, :telephone, :cellphone, :dwelling, :rental, :economicSituation, :children, :dependent, :schoolDays, :familyGroup, :income, :minors, :disabilityOrIllness, :clarifications, :vehicles, :card_id)
    end
end
