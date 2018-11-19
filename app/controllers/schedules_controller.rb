# frozen_string_literal: true

class SchedulesController < ApplicationController
  before_action :correct_access

  def index
    # 必要なパラメータがないとき、status400でreturn
    render(json: { status: 400, message: 'bad request.' }) && return if params[:year].nil?
    schedules = Schedule.search_for_year_of(params[:year])
    render json: { status: 200, data: schedules }
  end

  def create
    schedule = Schedule.new(schedule_params)
    if schedule.save
      render json: { status: 201, message: 'event was made successfully.' }
    else
      render json: { status: 400, message: 'bad request.' }
    end
  end

  def update
    schedule = Schedule.find(params[:id])
    if schedule.update(schedule_params)
      render json: { status: 201, message: 'event was updated successfully.' }
    else
      render json: { status: 400, message: 'bad request.' }
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    if schedule.destroy
      render json: { status: 204, message: 'event was deleted successfully.' }
    else
      render json: { status: 500 }
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :start, :finish, :all_day, :memo, :place)
  end

  # 正しいアクセスかどうか
  def correct_access
    # rubocop:disable Style/GuardClause
    unless request.headers[:Authorization] == ENV['ACCESS_KEY']
      render json: { status: 401, message: 'access token is not valid.' }
    end
    # rubocop:enable Style/GuardClause
  end
end
