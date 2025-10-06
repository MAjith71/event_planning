class AttendeesController < ApplicationController
    before_action :set_party, only: [:new, :create, :index]

    def new
        @attendee = @party.attendees.build
    end

    def create
        @attendee = @party.attendees.build(attendee_params)
        if @attendee.save
            redirect_to party_path(@party), notice: "Attendee added successfully."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def index
        @attendees = @party.attendees.all
    end

    def destroy
        @attendee = Attendee.find(params[:id])
        @attendee.destroy
        redirect_to parties_path, notice: "Attendee removed successfully."
    end

    def set_party
        @party = Party.find_by(id: params[:party_id])
    end

    def attendee_params
        params.require(:attendee).permit(:full_name, :email, :phone)
    end
end
