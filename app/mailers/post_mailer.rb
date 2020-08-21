class PostMailer < ApplicationMailer
  def poster
    @post = params[:post]
    mail to: @post.user.email,
         subject: "新增文章：#{@post.title}"
  end
end
