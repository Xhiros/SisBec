class DocFilesController < ApplicationController
  before_action :set_doc_file, only: [:show, :edit, :update, :destroy]
  File_URL = "students_files/";

  # GET /doc_files
  # GET /doc_files.json
  def index
    @doc_files = DocFile.all
  end

  # GET /doc_files/1
  # GET /doc_files/1.json
  def show
  end

  # GET /doc_files/new
  def new
    @doc_file = DocFile.new
  end

  # GET /doc_files/1/edit
  def edit
  end

  # POST /doc_files
  # POST /doc_files.json
  def create
    @doc_file = DocFile.new(doc_file_params)

    respond_to do |format|
      if @doc_file.save
        format.html { redirect_to @doc_file, notice: 'Doc file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @doc_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @doc_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doc_files/1
  # PATCH/PUT /doc_files/1.json
  def update
    respond_to do |format|
      if @doc_file.update(doc_file_params)
        format.html { redirect_to @doc_file, notice: 'Doc file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @doc_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_files/1
  # DELETE /doc_files/1.json
  def destroy
    @doc_file.destroy
    respond_to do |format|
      format.html { redirect_to doc_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc_file
      @doc_file = DocFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_file_params
      params.require(:doc_file).permit(:name, :clarification, :docOwner, :student_id)
    end
end
