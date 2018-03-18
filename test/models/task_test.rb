# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  priority    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'should be a valid task' do
    @task = Task.new( title: 'hello', description: 'Oh boy', priority: 1)
    assert @task.valid?
  end

  test 'should have title' do
    @task = Task.new( title: '', description: 'Oh boy', priority: 1)
    assert @task.invalid?
  end

  test 'should have description' do
    @task = Task.new( title: 'hello', description: '', priority: 1)
    assert @task.invalid?
  end

  test 'should have priority' do
    @task = Task.new( title: 'hello', description: 'oh boy', priority: nil)
    assert @task.invalid?
  end
end
