class RemoveAvatarFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :avatar, :string
  end
end
