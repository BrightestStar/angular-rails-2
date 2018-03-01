class AddDownvoteUserToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :downvote_user, :text, array: true
    add_column :comments, :downvote_user, :text, array: true
  end
end
