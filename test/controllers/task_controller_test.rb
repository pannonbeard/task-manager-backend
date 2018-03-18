require 'test_helper'

# testing welcome controller
class TaskController < ActionDispatch::IntegrationTest
  test 'should get index' do
    get tasks_path(format: :json)
    json = JSON.parse(@response.body)
    assert_equal Task.all.count, json['tasks'].count
    assert_response :success
  end
end
