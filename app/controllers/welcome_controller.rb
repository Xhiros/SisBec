class WelcomeController < ApplicationController
  layout 'home'
  def index
     respond_to do |format| 
      if user_signed_in?
        if current_user.admin
          format.html { redirect_to adminzone_index_path }
        else
          if Student.checkStudent(current_user.id)
            format.html { redirect_to students_path }
          else
            format.html { redirect_to new_student_path, alert: 'Debes llenar (o al menos crear) tu perfil de alumno.' }
          end
        end
      else
        format.html { render action: 'index' }
      end
    end
  end
end
