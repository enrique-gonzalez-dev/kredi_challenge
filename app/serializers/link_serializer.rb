class LinkSerializer < ActiveModel::Serializer
  attributes :id, :full, :short, :total_views

  def total_views
    object.views&.count
  end
end
