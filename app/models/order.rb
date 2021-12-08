class Order < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: 'OrderItem'
  has_many :products, through: :items

  def serialized
    as_json.merge!(products: products.as_json)
  end
end