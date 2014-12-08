class HospitalsController < ApplicationController

	def new
		@hospital = Hospital.new()
	end

	def create
	  	@hospital = Hospital.new(hospital_params)
	  	@hospital.save
	  	redirect_to hospitals_path
	end

	def index
	  	@hospital = Hospital.all
	end

	def show
		@hospital = Hospital.find(params[:id])
	end

	def destroy
	  	@hospital = Hospital.find(params[:id])
	  	@hospital.destroy
	  	redirect_to hospitals_path
	end

	def edit
      	@hospital = Hospital.find(params[:id])
 	end
	
	def update
      	@hospital = Hospital.find(params[:id])

       	if @hospital.update_attributes(hospital_params)
        	redirect_to hospitals_path
        	flash[:notice] ='The Hospital is Updated successfully!'
       else
        	flash[:error] ='Missing Field'
        	redirect_to new_hospital_path
    	end 
  	end

	private

	def hospital_params 
	    params.require(:hospital).permit(:hospital_name, :hospital_address, :city, :area)
	end
	
end
