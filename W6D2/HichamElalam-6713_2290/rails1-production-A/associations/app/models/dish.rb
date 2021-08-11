# == Schema Information
#
# Table name: dishes
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  description   :text             not null
#  restaurant_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Dish < ApplicationRecord
    belongs_to :restaurant,
        class_name: :Restaurant,
        foreign_key: :restaurant_id,
        primary_key: :id

    has_many :cart_items,
        class_name: :CartItem,
        foreign_key: :dish_id,
        primary_key: :id

end
