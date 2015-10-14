require_relative "../test_helper"

class DeleteTaskTest < FeatureTest

  def test_user_can_delete_a_task
    TaskManager.create({ :title       => "The task title.",
                         :description => "a description"
                      })

    visit "/tasks"
    assert_equal "/tasks", current_path

    within(".table") do
      assert page.has_content?("The task title.")
    end

    click_button('Delete')

    assert_equal "/tasks", current_path

    within(".panel-body") do
      refute page.has_content?("The task title.")
    end
  end

end
