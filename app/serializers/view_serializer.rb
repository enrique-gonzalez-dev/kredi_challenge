class ViewSerializer < ActiveModel::Serializer
  attributes :operative_system, :browser, :ip_address, :date

  def date
    object.created_at.strftime("%F - %H:%M:%S")
  end
  
end
