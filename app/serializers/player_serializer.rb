class PlayerSerializer < ActiveModel::Serializer
  attributes :id
  has_one :game
end
