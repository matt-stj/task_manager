require_relative "../test_helper"

class NewTaskTest < FeatureTest

  def test_user_can_create_a_new_task
    visit "/tasks/new"
    assert_equal "/tasks/new", current_path

    fill_in("task[title]", with: "The task title.")
    fill_in("task[description]", with: "The description of the task.")
    click_button('submit')

    assert_equal "/tasks", current_path

    within(".table") do
      assert page.has_content?("The task title.")
    end
  end

end
