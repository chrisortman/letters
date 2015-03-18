class EmailProcessor

  def initialize(email)
    @email = email
  end

  def process
    Story.create(from: @email.from,
                 title: @email.subject,
                 text: @email.body)
  end
end