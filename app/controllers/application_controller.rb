class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :authenticate_user!
  def is_admin?
    Role.find_by(name: "Admin").id == current_user.role_id
  end

  def is_doctor?
    Role.find_by(name: "Company").id == current_user.role_id
  end

  def is_patient?
    Role.find_by(name: "Job Seeker").id == current_user.role_id
  end

  def is_account_exists?

     if is_admin?
      return true
    elsif is_doctor
      if current_user.Doctor
        return true
      else
        flash[:error] = "Please setup your account before continuing"
        redirect_to new_doctor_path if (params[:controller] != "doctors" or params[:action] != "new")
      end
    else # Job Seeker or Employee by default
      if current_user.Patient
        return true
      else
        flash[:error] = "Please setup your account before continuing"
        redirect_to new_patient_path if (params[:controller] != "patients" or params[:action] != "new")
      end
    end

    def is_admin
    unless is_admin?
      flash[:error] = "Sorry you are not allowed to access that page."
      redirect_to root_path
    end
  end

  def is_doctor
    unless is_doctor?
      flash[:error] = "Sorry you are not allowed to access that page."
      redirect_to root_path
    end
  end

  def is_patient
    unless is_patient?
      flash[:error] = "Sorry you are not allowed to access that page."
      redirect_to root_path
    end
  end

  end


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