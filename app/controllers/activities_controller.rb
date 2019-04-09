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

  def update
    @activity = Activity.find params[:id]

    if @activity.update activity_params
      redirect_to @activity, notice: 'Your activity was updated successfully.'
    else
      redirect_to @activity, alert: 'Whoops, something went wrong.'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    if current_user.id === @activity.user_id
      if @activity.present?
        @activity.destroy

        redirect_to root_path, notice: "Activity deleted"
      end
    else
      redirect_to root_path, alert: "This action is not possible!"
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:activity_name, :activity_duration, :activity_date, :user_id)
  end
end
