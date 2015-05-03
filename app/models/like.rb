class Like < ActiveRecord::Base
  belongs_to :page
  belongs_to :identity

  validates_presence_of :page
  validates_presence_of :identity
end
