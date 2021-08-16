class Blog < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :author_id}
    validates :body, presence: true

    
    belongs_to :author,
        class_name: :User,
        foreign_key: :author_id,
        primary_key: :id
    
    has_many :comments,
        class_name: :Comment,
        foreign_key: :blog_id,
        primary_key: :id,
        dependent: :destroy
    
end
