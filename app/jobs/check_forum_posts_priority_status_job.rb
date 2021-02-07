class CheckForumPostsPriorityStatusJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Prout Prout"
  end
end
