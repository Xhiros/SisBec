class ScholarshipsController < ApplicationController
  before_action :set_scholarship, only: [:show, :edit, :update, :destroy]

  # GET /scholarships
  # GET /scholarships.json
  def index
    @scholarships = Scholarship.all
  end

  # GET /scholarships/1
  # GET /scholarships/1.json
  def show
  end

  # GET /scholarships/new
  def new
    @scholarship = Scholarship.new
  end

  # GET /scholarships/1/edit
  def edit
  end

  # POST /scholarships
  # POST /scholarships.json
  def create
    @scholarship = Scholarship.new(scholarship_params)

    respond_to do |format|
      if @scholarship.save
        format.html { redirect_to @scholarship, notice: 'Scholarship was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scholarship }
      else
        format.html { render action: 'new' }
        format.json { render json: @scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scholarships/1
  # PATCH/PUT /scholarships/1.json
  def update
    respond_to do |format|
      if @scholarship.update(scholarship_params)
        format.html { redirect_to @scholarship, notice: 'Scholarship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scholarships/1
  # DELETE /scholarships/1.json
  def destroy
    @scholarship.destroy
    respond_to do |format|
      format.html { redirect_to scholarships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholarship
      @scholarship = Scholarship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scholarship_params
      params.require(:scholarship).permit(:student_id, :starting, :ending)
    end
end
