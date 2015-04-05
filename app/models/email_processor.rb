class EmailProcessor

  def initialize(email)
    @email = email
  end

  def process
    if subscribe_message?
      create_new_subscription
    elsif unsubscribe_message?
      remove_subscription
    else
      create_new_story
    end
  end

  private

  def subscribe_message?
    @email.body =~ /^subscribe/
  end

  def create_new_subscription
    existing = Subscription.where(email: @email.from).first
    if existing.nil?
      Subscription.create(email:@email.from)
      Notification.welcome(@email.from)
    end
  end

  def unsubscribe_message?
    @email.body =~ /^unsubscribe/
  end

  def remove_subscription
    Subscription.where(email: @email.from).delete_all
  end

  def create_new_story
    Story.create(from: @email.from,
                 title: @email.subject,
                 text: @email.body)
  end
end
