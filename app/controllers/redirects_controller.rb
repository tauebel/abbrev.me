class RedirectsController < ApplicationController
  def create
    @url = Url.find_by_shortened_url(params[:shortened_url])
    redirect_to @url.original_url
  end
end
