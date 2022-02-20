# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  def name_or_email
    user = User.find(user_id)
    user.name.presence || user.email
  end
end
