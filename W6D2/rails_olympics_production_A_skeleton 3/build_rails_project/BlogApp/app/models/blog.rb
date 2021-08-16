class Blog < ApplicationRecord
    belongs_to :author,
        class_name: :User,
        foreign_key: :author_id,
        primary_key: :id
    
    has_many :comments,
        class_name: :Comment,
        foreign_key: :blog_id,
        primary_key: :id
end
