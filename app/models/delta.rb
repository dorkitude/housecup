class Delta < ActiveRecord::Base
  belongs_to :house

  # pagination stuff from
    # http://www.andyhawthorne.net/2011/05/pagination-with-rails-3/
  cattr_reader :per_page
  @@per_page = 10
  
end
