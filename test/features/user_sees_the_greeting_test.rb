require_relative "../test_helper"

class GreetingTest < FeatureTest

  def test_user_can_see_greeting
    visit "/"
    assert_equal "/", current_path

    within("#greeting") do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end

end
