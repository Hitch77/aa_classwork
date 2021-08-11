# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  cart_id    :integer          not null
#  dish_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ApplicationRecord
    belongs_to :cart,
        class_name: :Cart,
        foreign_key: :cart_id,
        primary_key: :id
    
    belongs_to :dish,
        class_name: :Dish,
        foreign_key: :dish_id,
        primary_key: :id
    
end
