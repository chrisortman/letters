require 'rails_helper'

RSpec.describe "stories/index", :type => :view do
  before(:each) do
    assign(:stories, [
      Story.create!(
        :from => "From",
        :text => "Text",
        :user_id => 1,
        :title => "Title"
      ),
      Story.create!(
        :from => "From",
        :text => "Text",
        :user_id => 1,
        :title => "Title"
      )
    ])
  end

  it "renders a list of stories" do
    render
    assert_select "tr>td", :text => "From".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
