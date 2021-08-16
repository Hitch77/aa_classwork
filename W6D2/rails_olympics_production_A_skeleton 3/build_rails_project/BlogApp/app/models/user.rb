class User < ApplicationRecord
    validates :email, presence: true
    has_many :blogs,
        class_name: :Blog,
        foreign_key: :author_id,
        primary_key: :id

    has_many :comments,
        class_name: :Comment,
        foreign_key: :author_id,
        primary_key: :id

end
