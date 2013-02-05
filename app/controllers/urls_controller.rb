class UrlsController < ApplicationController
  
  def new
    @url = Url.new
  end
  
  def create
    @url = Url.new(params[:url])
    @url.user = current_user
    if @url.save
        if session[:url_ids]
          session[:url_ids] << @url.id
        else
          session[:url_ids] = [@url.id]
        end
      flash[:notice] = "Well done! Your URL was successfully shortened."
      redirect_to urls_path
    else
      flash[:alert] = "Sorry, your URL couldn't be shortened. Please try again, making sure to include 'http://' or 'https://'"
      render 'new'
    end
  end
  
  def index
    @url = Url.new
    @urls = []
    if current_user
      @urls = current_user.urls
    elsif session[:url_ids] && session[:url_ids].any?
      @urls = Url.find(session[:url_ids])
    end
  end
    
  
  def show
    @url = Url.find_by_shortened_url(params[:shortened_url])
    redirect_to @url.original_url
  end
end
