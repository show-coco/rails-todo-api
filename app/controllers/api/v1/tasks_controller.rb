module Api
    module V1        
        class TasksController < ApplicationController
            # GET /api/v1/tasks
            def index
                @tasks = Task.all.order(id: "DESC")
                render status: 200, json: { status: 200, data: @tasks } 
            end

            # POST /api/v1/tasks
            def create
                @task = Task.new(task_params)
                
                if @task.save
                    render status: 200, json: { status: 200, data: @task }
                elsif @task.title.blank?
                    render status: 400, json: { status: 400, data: @task.errors }
                else
                    render status: 500, json: { stauts: 500 }
                end
            end

            # PATCH /api/v1/tasks/:id
            def update
                @task = Task.find(params[:id])
                @task.title = params[:title]

                if @task.save
                    render status: 200, json: { status: 200, data: @task }
                elsif @task.title.blank?
                    render status: 400, json: { status: 400, data: @task.errors }
                else
                    render status: 500, json: { stauts: 500 }
                end
            end

            # DELETE /api/vi/tasks/:id
            def destroy
                @task = Task.find(params[:id])
                @task.destroy
                render status: 200, json: { status: 200, data: @task }
            end

            private 
            
                def task_params
                    params.require(:task).permit(:title)
                end
        end
     end
end
