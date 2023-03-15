class ActivitiesController < ApplicationController
  include HTTParty
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    call_bored_api
    @activity = Activity.new(@bored_api_params)

    if @activity.save
      redirect_to @activity
    elsif @response["error"]
      flash.alert = @response["error"] + ". Please try other parameters."
      redirect_to new_activity_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update(activity_params)
      redirect_to @activity
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    redirect_to activities_path, status: :see_other
  end

  private
    def activity_params
      params.require(:activity).permit(:name, :category, :participants, :price, :accessibility)
    end

    def call_bored_api
      request = build_bored_api_request
      @response = HTTParty.get("https://www.boredapi.com/api/activity?#{request}").parsed_response
      
      bored_api_params unless @response["error"]
    end

    def build_bored_api_request
      request = ""
      request += "&type=#{params["activity"]["category"]}" unless params["activity"]["category"].blank?
      request += "&participants=#{params["activity"]["participants"]}" unless params["activity"]["participants"].blank?
      request += "&accessibility=#{params["activity"]["accessibility"].to_f.round(1)}" unless params["activity"]["accessibility"].blank?
      request += "&price=#{params["activity"]["price"].to_f.round(1)}" unless params["activity"]["price"].blank?
      request
    end

    def bored_api_params
      @bored_api_params = {
        name: @response["activity"],
        category: @response["type"],
        participants: @response["participants"],
        price: @response["price"],
        link: @response["link"],
        key: @response["key"],
        accessibility: @response["accessibility"]
      }
    end
end
