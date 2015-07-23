class GameSerializer < ActiveModel::Serializer
  attributes :id

  has_many :players, :cards
end
