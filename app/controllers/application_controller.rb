class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role_id
  end

  def after_sign_in_path_for(user)
    
      role =Role.where(:id =>current_user.role_id).first.name

      if role == "Doctor"
        new_doctor_path
      elsif role == "Patient"
        new_patient_path
      elsif role=="Admin"
        home2_index_path
        
      else
        flash[:error]="can't redirect"
      end

  end
  
end