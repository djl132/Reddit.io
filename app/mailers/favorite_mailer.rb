class FavoriteMailer < ApplicationMailer
  default from: 'linderek618@gmail.com'

  def new_comment(user, post, comment)

# what exactly does this do?
    headers["Message-ID"] = "<comments/#{comment.id}@dunno.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@dunno.com>"
    headers["References"] = "<post/#{post.id}@dunno.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")

  end



#   def new_comment(user, post, comment)
#
# # #18
#     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
#     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
#     headers["References"] = "<post/#{post.id}@your-app-name.example>"
#
#     @user = user
#     @post = post
#     @comment = comment
#
# # #19
#     mail(to: user.email, subject: "New comment on #{post.title}")
#   end



end
