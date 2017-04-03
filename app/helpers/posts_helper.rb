module PostsHelper

# in order to edit or delete a  post, you must be admin or the owner of the post
  def user_is_authorized_for_post?(post)
      current_user && (current_user = post.user || current_user.admin?)
  end
end
