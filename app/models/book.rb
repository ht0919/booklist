class Book < ActiveRecord::Base
  belongs_to :auther
  belongs_to :publisher
end
