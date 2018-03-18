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
    end
  end
end
