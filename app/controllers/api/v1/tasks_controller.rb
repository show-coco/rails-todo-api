
class Api::V1::TasksController < ApplicationController
    # GET /api/v1/tasks
    def index
        @tasks = Task.all.order(id: "DESC")
        render json: @tasks
    end

    # POST /api/v1/tasks
    def create
        @task = Taks.new(title: params[:title])
    end
end

