class ScholarshipPetitionsController < ApplicationController
  before_action :set_scholarship_petition, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /scholarship_petitions
  # GET /scholarship_petitions.json
  def index
    # Mostrará solo las solicitudes de beca correspondientes al alumno logueado
    @scholarship_petitions = ScholarshipPetition.where(student_id: current_user.student.id).order('created_at DESC')
  end

  # GET /scholarship_petitions/1
  # GET /scholarship_petitions/1.json
  def show
    #Si no coincide el id del usuario logueado con el del alumno que quiere ver lo saca de la pagina
    #Evita que otros usuarios modifiquen los datos de los demas
    respond_to do |format| 
      if current_user.admin || (current_user.student.id != @scholarship_petition.student_id)
        format.html { redirect_to root_url, alert: 'Acceso denegado. !!No mires las cosas de los demas!!' }
        #format.json { render action: 'root', status: :created, location: @student }
      else
        format.html { render action: 'show' }
        #format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /scholarship_petitions/new
  def new
    @scholarship_petition = ScholarshipPetition.new
  end

  # GET /scholarship_petitions/1/edit
  def edit
    #Si no coincide el id del usuario logueado con el del alumno que quiere ver lo saca de la pagina
    #Evita que otros usuarios modifiquen los datos de los demas
    respond_to do |format| 
      if current_user.admin || (current_user.student.id != @scholarship_petition.student_id)
        format.html { redirect_to root_url, alert: 'Acceso denegado. !!No mires las cosas de los demas!!' }
        #format.json { render action: 'root', status: :created, location: @student }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /scholarship_petitions
  # POST /scholarship_petitions.json
  def create
    @scholarship_petition = ScholarshipPetition.new(scholarship_petition_params)
    @scholarship_petition.student_id = current_user.student.id

    respond_to do |format|
      if @scholarship_petition.save
        format.html { redirect_to @scholarship_petition, notice: 'Solicitud de beca creada. Ahora a esperar.' }
        format.json { render action: 'show', status: :created, location: @scholarship_petition }
      else
        format.html { render action: 'new' }
        format.json { render json: @scholarship_petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scholarship_petitions/1
  # PATCH/PUT /scholarship_petitions/1.json
  def update
    respond_to do |format|
      if @scholarship_petition.update(scholarship_petition_params)
        format.html { redirect_to @scholarship_petition, notice: 'Scholarship petition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scholarship_petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scholarship_petitions/1
  # DELETE /scholarship_petitions/1.json
  def destroy
    @scholarship_petition.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholarship_petition
      @scholarship_petition = ScholarshipPetition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scholarship_petition_params
      params.require(:scholarship_petition).permit(:student_id, :scholarship_type, :approved)
    end
end
