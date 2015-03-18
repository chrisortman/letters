class HomeController < ApplicationController
  def index
    @subscriber_count = Subscription.count
    @story_count = Story.count
    @letter_count = Letter.count
  end
end
