# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    # testing welcome controller
    class TaskController < ActionDispatch::IntegrationTest
      test 'should get index' do
        get api_v1_tasks_path(format: :json)
        json = JSON.parse(@response.body)
        assert_equal Task.all.count, json['tasks'].count
        assert_response :success
      end

      test 'should create task' do
        assert_difference('Task.count') do
          post api_v1_tasks_path, params: {
            task: {
              title: 'This',
              description: 'Oh noes',
              priority: 2
            }
          }
        end
        assert_response :ok
      end

      test 'should reject task without title' do
        assert_no_difference('Task.count') do
          post api_v1_tasks_path, params: {
            task: {
              title: '',
              description: 'Oh noes',
              priority: 2
            }
          }
        end
        assert_response :unprocessable_entity
        json = JSON.parse(@response.body)
        assert json['errors'].present?
      end

      test 'should reject task without description' do
        assert_no_difference('Task.count') do
          post api_v1_tasks_path, params: {
            task: {
              title: 'hello boys',
              description: '',
              priority: 2
            }
          }
        end
        assert_response :unprocessable_entity
        json = JSON.parse(@response.body)
        assert json['errors'].present?
      end

      test 'should update a task' do
        @task = tasks(:one)
        old_task_title = @task.title
        patch api_v1_task_path(@task), params: {
          task: {
            title: 'hello boys',
            description: 'blah blah',
            priority: 2
          }
        }
        @task.reload
        assert old_task_title != @task.title
        assert_response :ok
      end

      test 'should fail to update a task' do
        @task = tasks(:one)
        old_task_title = @task.title
        patch api_v1_task_path(@task), params: {
          task: {
            title: '',
            description: 'blah blah',
            priority: 2
          }
        }
        @task.reload
        assert_not old_task_title != @task.title
        assert_response :unprocessable_entity
        json = JSON.parse(@response.body)
        assert json['errors'].present?
      end

      test 'should delete a task' do
        @task = tasks(:one)
        assert_difference('Task.count', -1, 'should remove task') do
          delete api_v1_task_path(@task)
        end
        assert_response :ok
      end
    end
  end
end
