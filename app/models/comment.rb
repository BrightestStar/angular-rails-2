class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  serialize :upvote_user, Array
  serialize :downvote_user, Array

  def as_json(options = {})
    super(options.merge(include: :user))
  end
end
