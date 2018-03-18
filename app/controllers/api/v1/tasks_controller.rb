# frozen_string_literal: true

module Api
  module V1
    # Tasks controller
    class TasksController < ApplicationController
      def index
        @tasks = Task.all
      end

      def create
        @task = Task.new(task_params)
        process_task(@task.save)
      end

      def update
        @task = Task.find(params[:id])
        process_task(@task.update(task_params))
      end

      private

      def task_params
        params.require(:task).permit(:title, :description, :priority)
      end

      def process_task(processed_task)
        if processed_task
          render json: { result: 'Success', task: @task }, status: :ok
        else
          render json: {
            result: 'error',
            errors: @task.errors
          }, status: :unprocessable_entity
        end
      end
    end
  end
end
