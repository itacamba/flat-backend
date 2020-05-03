class WordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :topic
  has_many :rounds
end
