class UrlsController < ApplicationController
  
  def new
    @url = Url.new
  end
  
  def create
    @url = Url.new(params[:url])
    if @url.save
      flash[:notice] = "Well done! Your URL was successfully shortened."
      redirect_to url_path(@url)
    else
      flash[:alert] = "Sorry, your URL couldn't be shortened. Please try again, making sure to include 'http://' or 'https://'"
      render 'new'
    end
  end
  
  def show
    @url = Url.find(params[:id])
  end
end
