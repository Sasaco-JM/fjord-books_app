# frozen_string_literal: true

class UserFollowRelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = UserFollowRelationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
