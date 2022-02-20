class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def name_or_email
    user = User.find(self.user_id)
    if user.name.present?
      user.name
    else
      user.email
    end
  end
end
