class CommentsController < ApplicationController
# must be signed in to create comment
before_action :require_sign_in

# if want to destory, must be authorized
before_action :authorize_user, only: [:destroy]

def create
  @post = Post.find(params[:post_id])
  # look over mass assignment
  comment = @post.comments.new(comment_params)
  comment.user = current_user
  
    if comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to [@post.topic, @post] # re render post page
    else
      flash[:alert] = "Comment failed to save."
      redirect_to [@post.topic, @post] # re render post page
    end
end

def destroy

  # why not juse use the COMMENT id
  @post = Post.find(params[:post_id])
  comment = @post.comments.find(params[:id])

  if comment.destroy
    flash[:notice] = "Comment was deleted."
    redirect_to [@post.topic, @post]
  else
    flash[:alert] = "Comment couldn't be deleted. Try again."
    redirect_to [@post.topic, @post]
  end
end


private


    def comment_params
      params.require(:comment).permit(:body)
    end

# authoize Destroy comment
    def authorize_user
      comment = Comment.find(params[:id])
      unless current_user == comment.user || current_user.admin?
        flash[:alert] = "You do not have permission to delete a comment."
        redirect_to [comment.post.topic, comment.post]
      end
    end

end
