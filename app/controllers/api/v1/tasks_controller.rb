module Api
  module V1
    # Tasks controller
    class TasksController < ApplicationController
      def index
        @tasks = Task.all
      end
    end
  end
end
