class TasksController < ApplicationController

    def index
       @tasks = Task.all.order(id: "DESC")
       render json: @tasks
    end
end
