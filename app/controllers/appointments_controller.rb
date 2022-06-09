class AppointmentsController < ApplicationController
    def index
        @appointments=Appointment.all
        @doctors= Doctor.all
        @patients=Patient.all
    end

    def show
        @appointment=Appointment.find(params[:id])
        @doc=Doctor.find(params[:id]).appointments
        @pat=Doctor.find(params[:id]).appointments
    end

    def new
        @appointment=Appointment.new
    end

    def create
        @appointment=Appointment.new(appointment_params)
        if @appointment.save
         redirect_to @appointment
        else
         render :new , status: :unprocessable_entity
        end
    end

    def edit
        @appointment=Appointment.find(params[:id])
    end

    def update
        @appointment=Appointment.find(params[:id])
        if @appointment.update(appointment_params)
         redirect_to @appointment
        else
         render :edit , status: :unprocessable_entity
        end
    end

    def destroy
        @appointment=Appointment.destroy

        redirect_to root_path , status: :see_others
    end

    private
    def appointment_params
    params.require(:appointment).permit(:doctor_id,:patient_id,:desc,:date)    
    end


end
