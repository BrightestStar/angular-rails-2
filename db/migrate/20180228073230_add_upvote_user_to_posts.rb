class AddUpvoteUserToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :upvote_user, :text, array: true
    add_column :comments, :upvote_user, :text, array: true
  end
end
