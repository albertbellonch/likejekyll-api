class PageSerializer < ActiveModel::Serializer
  attributes :uri, :likes_count, :liked

  def likes_count
    object.likes.count
  end

  def liked
    scope.liked_to_page?(object)
  end
end
