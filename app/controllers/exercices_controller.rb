class ExercicesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_exercise, except:[:index, :new, :create]
    def index
        @exercices = current_user.exercices.all
    end
    
    
    def show
        
        
    end
    
    def new
        @exercise = current_user.exercices.new
    end
    
    
    def create
        @exercise = current_user.exercices.new(exercice_params)
        if @exercise.save
            flash[:success] = "Exercise has been created"
            redirect_to [current_user, @exercise]
        else
            flash[:danger] = "Exercise has not been created"
            render :new
        end
    end
    
    
    private
    
    def exercice_params
        params.require(:exercice).permit(:duration_in_min, :workout, :workout_date, :user_id)
    end
    
    def set_exercise
       @exercise = current_user.exercices.find(params[:id]) 
    end
    
    
end
