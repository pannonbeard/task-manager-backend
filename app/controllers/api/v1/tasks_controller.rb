module Api
  module V1
    # Tasks controller
    class TasksController < ApplicationController
      def index
        @tasks = Task.all
      end

      def create
        @task = Task.new(task_params)
        if @task.save
          render json: { result: 'Success', task: @task }, status: :ok
        else
          render json: { result: 'error', errors: @task.errors }, status: :unprocessable_entity
        end
      end

      private

      def task_params
        params.require(:task).permit(:title, :description, :priority)
      end
    end
  end
end
