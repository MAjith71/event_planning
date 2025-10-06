class PartiesController < ApplicationController
    before_action :set_party, only: [:edit, :update, :destroy]

    def new
        @party = Party.new
    end

    def create
        @party = Party.new(party_params)
        respond_to do |format|
            if @party.save
                format.html { redirect_to parties_path, notice: "Party was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @party.update(party_params)
                notice = if params[:from_page] == "attendees"
                    "Attendees was successfully updated."
                else
                    "Party was successfully updated."
                end
                format.html { redirect_to parties_path, notice: notice }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def index
        @parties = Party.all
    end

    def destroy
        @party.destroy
        respond_to do |format|
            format.html { redirect_to parties_url, notice: "Party was successfully deleted." }
        end
    end

    private
    def set_party
        @party = Party.find_by(id: params[:id])
    end

    def party_params
      params.require(:party).permit(:id, :title, :description, :date_time, attendees_attributes: [:id, :full_name, :email, :phone, :_destroy])
    end
end
