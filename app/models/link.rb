class Link < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :url, url: true
  validates :viewed, presence: true

  enum viewed: ["Mark as Read", "Mark as Unread"]
end
