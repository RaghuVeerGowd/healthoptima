class PatientsController < ApplicationController

	def new
		@patient = Patient.new
	end

	def create
	  	@patient = Patient.new(patient_params)
	  	@patient.save
	  	redirect_to patients_path(@patient.id)
	end

	def index
	  	@patient = Patient.all
	end

	def show
		@patient = Patient.find(patient_params[:id])
	end

	def destroy
	  	@patient = Patient.find(params[:id])
	  	@patient.destroy
	  	redirect_to patients_path
	end


	def edit
      	@patient = Patient.find(params[:id])
  	end

	def update
   		@patient = Patient.find(params[:id])

       	if @patient.update_attributes(patient_params)

        	redirect_to patients_path
        	flash[:success] ='The Patient is Updated successfully!'    
   	    else
        	flash[:error] ='Missing Field'
        	redirect_to new_patient_path
    	end 
  	end
	private

	def patient_params 
	    params.require(:patient).permit(:user_id, :name, :ph_number, :address, :reason, :doctor_id, :appointment_date)
	end
end