class VictimsController < ApplicationController
  before_action :set_victim, only: [:show]

  def index
    @victims = Victim.all
  end

  def show
  end

  def bam
    render :bam
  end

  private

    def set_victim
      @victim = Victim.find(params[:id])
    end

    def victim_params
      params.require(:victim).permit(:name, :real_email)
    end
end
