class Url < ActiveRecord::Base
  before_create :get_shortened_url
  attr_accessible :original_url, :shortened_url
  
  validates :original_url, :format => { :with => /https?:\/\/[\S]+/, :message => "Your URL must begin with 'http:// or https://"}
  
  private
  
  def get_shortened_url
    self.shortened_url = (('a'..'z').to_a + (0..9).to_a).sample(6).join
  end
end
