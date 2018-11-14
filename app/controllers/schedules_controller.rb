class SchedulesController < ApplicationController

  def index

  end

  def create
    schedule = Schedule.new(schedule_params)
    if schedule.save
      render json: { status: 200, message: "event was made successfully."}
    else
      render json: { status: 400, message: "bad request."}
    end
  end

  def update

  end

  def destroy

  end

  private
    def schedule_params
      params.require(:schedule).permit(:title, :start, :finish, :all_day, :memo, :place)
    end

end
