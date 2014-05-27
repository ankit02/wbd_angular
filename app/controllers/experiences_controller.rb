class ExperiencesController < ApplicationController
    #before_action :set_experience, only: [:show, :edit, :update, :destroy]
    respond_to :json
    

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
   
  end

  def getjson
     @experiences = Experience.all
    respond_with(@experiences) do |format|
      format.json {render :json => @experiences.as_json}
  end    
end

def getjson_post
     @experiences = Experience.all
    respond_with(@experiences) do |format|
      format.json {render :json => @experiences.as_json}
  end    
end


  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @experience = Experience.find(params[:id])
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
     @experience = Experience.find(params[:id])
  end

  # POST /experiences
  # POST /experiences.json
  def create
    #debugger
    @experience = Experience.new
    @experience.experience_name = params[:new_experience][:experience_name]
    @experience.special = params[:new_experience][:special]
    @experience.budget = params[:new_experience][:budget]
    @experience.description = params[:new_experience][:description]

    # respond_to do |format|
    #   if @experience.save
    #     format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @experience }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @experience.errors, status: :unprocessable_entity }
    #   end
    # end
    if @experience.valid?
         if @experience.save!
    else
      render "public/422", :status => 422   
      return
     end
    end 
     
     respond_with(@experience) do |format|
      format.json {render :json => @experience.as_json}
      #debugger
     end    
    #  debugger
    # respond_with Experience.create(params[:experience])
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      debugger
      @experience = Experience.find(params[:id])
      if @experience.update(params[:new_experience].permit(:experience_name,:special,:budget,:description))
        #debugger
        #format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: 'edit' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params[:experience].permit(:experience_name,:special,:budget,:description)
    end
end
