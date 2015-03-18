require 'rails_helper'

RSpec.describe "stories/show", :type => :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :from => "From",
      :text => "Text",
      :user_id => 1,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/From/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Title/)
  end
end
