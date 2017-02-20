class ScreensController < ApplicationController
  def new; end

  def show; end

  def index; end

  def edit; end

  def create
  	@screen = Screen.new(screen_params)

  	if @screen.save
  		redirect_to @screen
  	else
  		@errors = @screen.errors.full_messages
  		render :new
  	end
  end

  private

  def screen_params
  	params.require(:screen).permit(:number, :capacity, :description)
  end
end
