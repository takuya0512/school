class SeatingsController < ApplicationController
  before_action :set_seating, only: [:show, :edit, :update, :destroy]

  def index
  end

  def select_pattern
    @pattern = params[:pattern]
    
    render "new#{@pattern}" if ['A', 'B', 'C'].include?(@pattern)
  end

  def new
    @seating = Seating.new
    select_pattern
  end

  def create
    @seating = Seating.new(seating_params)
    if @seating.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_seating
    @seating = Seating.find(params[:id])
  end

  def seating_params
    params.require(:seating).permit(students_attributes: [:id, :name, :table_code, :position_code])
  end
end

