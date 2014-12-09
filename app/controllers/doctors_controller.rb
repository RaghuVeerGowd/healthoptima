class DoctorsController < ApplicationController

	def new
		@doctor = Doctor.new()
	end

	def create
	  	@doctor = Doctor.new(doctor_params)
	  	@doctor.save
	  	redirect_to doctors_path
	end

	def index
	  	@doctor = Doctor.all
	end

	def show
		@doctor = Doctor.find(doctor_params[:id])
	end

	def edit
      	@doctor = Doctor.find(params[:id])
  	end

	def update
    	@doctor = Doctor.find(params[:id])

       	if @doctor.update_attributes(doctor_params)

       		flash[:success] ='The Hospital is Updated successfully!'
        	redirect_to doctors_path
        	
       else
        	flash[:error] ='Missing Field'
        	redirect_to new_doctor_path
    	end 
  	end

	def destroy
		@doctor = Doctor.find(params[:id])
	  	@doctor.destroy
	  	redirect_to doctors_path
	end
	
	private

	def doctor_params 
	    params.require(:doctor).permit(:user_id, :doctor_name, :expertise, :experience, :email, :gender)
	end
end