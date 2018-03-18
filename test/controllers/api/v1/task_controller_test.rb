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
    end
  end
end
