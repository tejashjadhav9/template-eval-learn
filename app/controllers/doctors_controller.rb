class DoctorsController < ApplicationController
    def new
        @doctor=Doctor.new
    end

    def show
        @doctor=Appointment.find(params[:id]).doctors
    end

    def create
        @doctor=Doctor.new(doctor_params)
        if @doctor.save
         redirect_to @doctor
        else
         render :new , status: :unprocessable_entity
        end
    end

    def edit
        @doctor=Doctor.find(params[:id])
    end

    def update
        @doctor=Doctor.find(params[:id])
        if @doctor.update(doctor_params)
         redirect_to @doctor
        else
         render :edit , status: :unprocessable_entity
        end
    end

    def destroy
        @doctor=Doctor.destroy

        redirect_to root_path , status: :see_others
    end

    private
    def doctor_params
    params.require(:doctor).permit(:id,:name)    
    end

end
