require_relative "../test_helper"

class UpdateTaskTest < FeatureTest

  def test_user_can_update_a_task
    TaskManager.create({ :title       => "The task title.",
                         :description => "a description"
                      })

    visit "/tasks/1/edit"
    assert_equal "/tasks/1/edit", current_path

    fill_in("task[title]", with: "The task title (updated).")
    fill_in("task[description]", with: "The description of the task (updated).")
    click_button('submit')

    assert_equal "/tasks", current_path

    within(".table") do
      assert page.has_content?("The task title (updated).")
    end
  end

end
