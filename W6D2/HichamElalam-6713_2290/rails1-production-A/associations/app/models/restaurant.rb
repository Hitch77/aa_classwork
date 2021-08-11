# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#

class Restaurant < ApplicationRecord
    belongs_to :owner,
        class_name: :User,
        foreign_key: :owner_id,
        primary_key: :id
    
    has_many :dishes,
        class_name: :Dish,
        foreign_key: :restaurant_id,
        primary_key: :id

    has_many :reviews,
        class_name: :Review,
        foreign_key: :restaurant_id,
        primary_key: :id
    
    has_many :customers_reviewed,
        through: :reviews,
        source: :reviewer
end
