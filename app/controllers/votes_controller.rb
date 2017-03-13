class VotesController < ApplicationController

  before_action :require_sign_in

  def up_vote
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first

    if !@vote
      @vote = current_user.votes.create(value: 1, post: @post)
    elsif @vote.value == 1
      @vote.destroy
    else
      @vote.update_attribute(:value, 1)
    end

# send to page taht triggered the action
    redirect_to :back
  end

  def down_vote
     @post = Post.find(params[:post_id])
     @vote = @post.votes.where(user_id: current_user.id).first

     if !@vote
       @vote = current_user.votes.create(value: -1, post: @post)
     elsif @vote.value == -1
       @vote.destroy
     else
       @vote.update_attribute(:value, -1)
     end

     redirect_to :back
   end



   private
  #  def update_vote(new_value)
  #    @post = Post.find(params[:post_id])
  #    @vote = @post.votes.where(user_id: current_user.id).first
   #
  #    if @vote
  #      @vote.update_attribute(:value, new_value)
  #    else
  #      @vote = current_user.votes.create(value: new_value, post: @post)
  #    end
  #  end


end
