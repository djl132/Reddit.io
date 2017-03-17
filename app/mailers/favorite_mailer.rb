class FavoriteMailer < ApplicationMailer
  default from: 'linderek618@gmail.com'

# wait arent' these instance methods?  how come I can call them on a class
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


  def new_post(user, post)

    headers["Message-ID"] = "<post/#{post.id}@dunno.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@dunno.com>"
    headers["References"] = "<post/#{post.id}@dunno.com>"
    puts user
    puts post

        @user = user
        @post = post
        mail(to: user.email, subject: "You are tracking your post: #{post.title}")
  end

  # def new_post(post)
  #
  #   headers["Message-ID"] = "<post/#{post.id}@dunno.com>"
  #   headers["In-Reply-To"] = "<post/#{post.id}@dunno.com>"
  #   headers["References"] = "<post/#{post.id}@dunno.com>"
  #   puts post
  #
  #       @post = post
  #       mail(to: post.user.email, subject: "You are tracking your post: #{post.title}")
  # end


end
