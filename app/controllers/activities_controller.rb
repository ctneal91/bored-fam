class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @activitiy = Activity.new(activity_params)

    if @activity.save
      redirect_to @activity
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def activity_params
      params.require(:activity).permit(:name, :type, :participants, :price, :accessibility)
    end
end
