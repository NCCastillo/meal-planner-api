class MenuSerializer < ActiveModel::Serializer
  attributes :id, :week_of

  has_many :menu_items
end
