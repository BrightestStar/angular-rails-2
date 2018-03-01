class Post < ApplicationRecord
  include ActiveModel::Serializers::JSON
  has_many :comments, dependent: :destroy
  belongs_to :user

  serialize :upvote_user, Array

  def as_json(options = {})
    super(options.merge(include: [:user, comments: {include: :user}]))
  end
end
