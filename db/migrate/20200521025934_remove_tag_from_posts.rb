class RemoveTagFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :tag_id, :string
  end
end