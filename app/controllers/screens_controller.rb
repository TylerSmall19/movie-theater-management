class ScreensController < ApplicationController
  def new; end

  def show; end

  def index; end

  def edit
  	@screen = Screen.find_by(id: params[:id])
  end

  def create
  	@screen = Screen.new(screen_params)

  	if @screen.save
  		redirect_to @screen
  	else
  		@errors = @screen.errors.full_messages
  		render :new
  	end
  end

  def update
  	@screen = Screen.find_by(id: params[:id])
  	@screen.update_attributes(screen_params)

  	if @screen.save
  		redirect_to @screen
  	else
  		@errors = @screen.errors.full_messages
  		render :edit
  	end
  end

  private

  def screen_params
  	params.require(:screen).permit(:number, :capacity, :description)
  end
end
