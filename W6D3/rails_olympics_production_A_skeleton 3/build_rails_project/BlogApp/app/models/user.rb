class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    has_many :blogs,
        class_name: :Blog,
        foreign_key: :author_id,
        primary_key: :id

    has_many :comments,
        class_name: :Comment,
        foreign_key: :author_id,
        primary_key: :id
    
    has_many :comments_on_blogs,
        through: :blogs,
        source: :comments
    
    has_many :blogs_commented_on,
        through: :comments,
        source: :blog
end