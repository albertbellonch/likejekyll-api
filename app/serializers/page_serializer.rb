class PageSerializer < ActiveModel::Serializer
  attributes :uri, :likes_count

  def likes_count
    object.likes.count
  end
end
