require 'digest'

class Page < ActiveRecord::Base
  validates :uri, presence: true, uniqueness: true

  has_many :likes

  before_save :set_digest, on: :create

  private

  def set_digest
    self.digest = Digest::MD5.new.update(uri).hexdigest
  end
end
