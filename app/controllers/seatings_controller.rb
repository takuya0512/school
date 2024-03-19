class SeatingsController < ApplicationController
  def index
  end

  def select_pattern
    @pattern = params[:pattern]
    render "new#{@pattern}" if ['A', 'B', 'C'].include?(@pattern)
  end

  def new
    @pattern = params[:pattern]
  end

  def create
  end
end
