class Identity < ActiveRecord::Base
  validates :ip, presence: true, uniqueness: true

  has_many :likes

  def like!(page)
    return false if liked_to_page?(page)

    likes.create! page: page

    true
  end

  private

  def liked_to_page?(page)
    likes.find_by_page_id(page.id).present?
  end
end
