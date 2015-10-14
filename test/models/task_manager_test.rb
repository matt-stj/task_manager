require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def create_tasks(num)
    num.times do |i|
      TaskManager.create({ :title       => "My Title#{i}",
                           :description => "a description#{i}"
                        })
    end
  end

  def test_we_can_create_a_task
    TaskManager.create({ :title       => "My Title",
                         :description => "a description"
                      })
    task = TaskManager.find(1)
    assert_equal "My Title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_we_can_list_all_tasks
    TaskManager.create({ :title       => "My Title",
                         :description => "a description"
                      })
    TaskManager.create({ :title       => "My Second Title",
                         :description => "a second description"
                      })

    tasks = TaskManager.all
    assert_equal "My Title", tasks.first.title
    assert_equal "My Second Title", tasks[1].title

    assert_equal "a description", tasks.first.description
    assert_equal "a second description", tasks[1].description

    assert_equal 1, tasks.first.id
    assert_equal 2, tasks[1].id
  end

  def test_we_can_find_a_task_by_its_id
    TaskManager.create({ :title       => "My Title",
                         :description => "a description"
                      })
    TaskManager.create({ :title       => "My Second Title",
                         :description => "a second description"
                      })

    task = TaskManager.find(2)
    assert_equal "My Second Title", task.title
  end

  def test_we_can_update_an_existing_task
    TaskManager.create({ :title       => "My Title",
                         :description => "a description"
                      })
    task = TaskManager.find(1)
    assert_equal "My Title", task.title

    TaskManager.update(1, {:title => "My Title (Updated)"})
    updated_task = TaskManager.find(1)
    assert_equal "My Title (Updated)", updated_task.title
  end

  def test_we_can_delete_a_task
    TaskManager.create({ :title       => "My Title",
                         :description => "a description"
                      })
    TaskManager.create({ :title       => "My Second Title",
                         :description => "a second description"
                      })

    number_of_tasks = TaskManager.all.size
    assert_equal 2, number_of_tasks
    TaskManager.delete(1)
    updated_number_of_tasks = TaskManager.all.size
    assert_equal 1, updated_number_of_tasks
  end

end
