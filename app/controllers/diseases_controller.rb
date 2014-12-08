class DiseasesController < ApplicationController

	def new
		@disease = Disease.new()
	end

	def create
	 	@disease = Disease.new(diseases_params)
	  	@disease.save
	  	redirect_to diseases_path
	end

	def index
		@disease = Disease.all
	end

	def show
		@disease = Disease.find(params[:id])
	end

	def edit
      	@disease = Disease.find(params[:id])
  	end

	def update
   		@disease = Disease.find(params[:id])

       	if @disease.update_attributes(diseases_params)

        	redirect_to diseases_path
        	flash[:success] ='The Hospital is Updated successfully!'    
   	    else
        	flash[:error] ='Missing Field'
        	redirect_to new_disease_path
    	end 
  	end

	def destroy
		@disease = Disease.find(params[:id])
	  	@disease.destroy
	  	redirect_to diseases_path
	end
	
	private

	def diseases_params 
	    params.require(:disease).permit(:diseases_name, :symptoms)
	end

end
