class Identity < ActiveRecord::Base
  validates :ip, presence: true, uniqueness: true

  has_many :likes
end
