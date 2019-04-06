class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order("activity_date desc")
    if current_user
      @activities_user = Activity.where(user_id: current_user.id).order("date desc")
    end
  end

  def show
    @activity = Activity.find params[:id]
  end

  def new
  end

  def create
    # render plain: params[:activity].inspect
    @activity = Activity.new activity_params
    @activity.save

    redirect_to @activity
  end

  def edit
    @activity = Activity.find params[:id]
  end

  def destroy
    @activity = Activity.find(params[:id])
    if @activity.present?
      @activity.destroy
    end

    redirect_to root_path, notice: "Activity deleted"
  end

  private

  def activity_params
    params.require(:activity).permit(:activity_name, :activity_duration, :activity_date, :user_id)
  end
end
