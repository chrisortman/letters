require 'rails_helper'

RSpec.describe "stories/new", :type => :view do
  before(:each) do
    assign(:story, Story.new(
      :from => "MyString",
      :text => "MyString",
      :user_id => 1,
      :title => "MyString"
    ))
  end

  it "renders new story form" do
    render

    assert_select "form[action=?][method=?]", stories_path, "post" do

      assert_select "input#story_from[name=?]", "story[from]"

      assert_select "input#story_text[name=?]", "story[text]"

      assert_select "input#story_user_id[name=?]", "story[user_id]"

      assert_select "input#story_title[name=?]", "story[title]"
    end
  end
end
