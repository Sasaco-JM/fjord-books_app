# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def created_user_name_or_email
    user = User.find(user_id)
    user.name.presence || user.email
  end
end
