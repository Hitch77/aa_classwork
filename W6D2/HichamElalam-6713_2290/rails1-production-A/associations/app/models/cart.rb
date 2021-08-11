# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
    has_many :cart_items,
        class_name: :CartItem,
        foreign_key: :cart_id,
        primary_key: :id
    
    belongs_to :customer,
        class_name: :User,
        foreign_key: :user_id,
        primary_key: :id

    has_many :dishes,
        through: :cart_items,
        source: :dish
  
end
