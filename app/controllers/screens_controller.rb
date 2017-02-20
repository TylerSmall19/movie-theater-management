class ScreensController < ApplicationController
  def new; end

  def show; end

  def index
  	@screens = Screen.order(:number)
  end

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
  		redirect_to screens_path
  	else
  		@errors = @screen.errors.full_messages
  		render :edit
  	end
  end

  def destroy
  	Screen.find_by(id: params[:id]).destroy
  	redirect_to screens_path
  end

  private

  def screen_params
  	params.require(:screen)
  				.permit(:number, 
  								:capacity, 
  								:description, 
  								:movie_id)
  end
end
