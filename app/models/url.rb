class Url < ActiveRecord::Base
  attr_accessible :original_url, :shortened_url
end
