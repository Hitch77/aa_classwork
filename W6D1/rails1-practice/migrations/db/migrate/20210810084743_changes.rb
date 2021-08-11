class Changes < ActiveRecord::Migration[5.2]
  def change
    add_index :comments, :parent_comment_id
    rename_column :users, :email, :username
    remove_column :users, :bio
    rename_column :videos, :name, :title
    add_index :videos, :uploader_id
  end
end
