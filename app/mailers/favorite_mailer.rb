class FavoriteMailer < ApplicationMailer
  default from: 'linderek618@gmail.com'



  def self.new_comment(user, post, comment)

# what exactly does this do?
    headers["Message-ID"] = "<comments/#{comment.id}@dunno.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@dunno.com>"
    headers["References"] = "<post/#{post.id}@dunno.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")

  end

end
