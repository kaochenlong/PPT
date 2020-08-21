class SendmailJob < ApplicationJob
  queue_as :default

  def perform(post)
    puts "------------------------------"
    puts "寄信囉!!"
    puts "------------------------------"
    PostMailer.with(post: post).poster.deliver_now
  end
end
