class Comment < ApplicationRecord
    belongs_to :blog,
        class_name: :Blog,
        foreign_key: :blog_id,
        primary_key: :id
    
    belongs_to :commenter,
        class_name: :User,
        foreign_key: :author_id,
        primary_key: :id
end
