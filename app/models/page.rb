class Page < ActiveRecord::Base
  validates :uri, presence: true, uniqueness: true

  has_many :likes
end
