class PatientsController < ApplicationController
    def new
        @patient=Patient.new
    end

    def create
        @patient=Patient.new(patient_params)
        if @patient.save
         redirect_to @patient
        else
         render :new , status: :unprocessable_entity
        end
    end

    def edit
        @patient=Patient.find(params[:id])
    end

    def update
        @patient=Patient.find(params[:id])
        if @patient.update(patient_params)
         redirect_to @patient
        else
         render :edit , status: :unprocessable_entity
        end
    end

    def destroy
        @patient=Patient.destroy

        redirect_to root_path , status: :see_others
    end

    private
    def patient_params
    params.require(:patient).permit(:id,:name)    
    end

    
end
