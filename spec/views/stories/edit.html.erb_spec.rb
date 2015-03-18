require 'rails_helper'

RSpec.describe "stories/edit", :type => :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :from => "MyString",
      :text => "MyString",
      :user_id => 1,
      :title => "MyString"
    ))
  end

  it "renders the edit story form" do
    render

    assert_select "form[action=?][method=?]", story_path(@story), "post" do

      assert_select "input#story_from[name=?]", "story[from]"

      assert_select "textarea#story_text[name=?]", "story[text]"

      assert_select "input#story_title[name=?]", "story[title]"
    end
  end
end
