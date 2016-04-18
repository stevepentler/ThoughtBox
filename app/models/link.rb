class Link < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :url, url: true

  enum viewed: [:false, :true]
end
