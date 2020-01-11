module Api
    module V1        
        class TasksController < ApplicationController
            # GET /api/v1/tasks
            def index
                @tasks = Task.all.order(id: "DESC")
                render json: { status: 'SUCCESS', data: @tasks } 
            end

            # POST /api/v1/tasks
            def create
                @task = Task.new(task_params)
                
                if @task.save
                    render json: { status: 'SUCCESS', data: @task }
                else
                    render json: { status: 'ERROR', data: @task.errors }
                end
            end

            # PATCH /api/v1/tasks/:id
            def update
                @task = Task.find(params[:id])
                @task.title = params[:title]

                if @task.save
                    render json: { status: 'SUCCESS', data: @task }
                else
                    render json: { status: 'ERROR', data: @task.errors }
                end
            end

            # DELETE /api/vi/tasks/:id
            def destroy
                @task = Task.find(params[:id])
                @task.destroy
                render json: { status: 'SUCCESS', data: @task }
            end

            private 
            
            def task_params
                params.require(:task).permit(:title)
            end
        end
     end
end
