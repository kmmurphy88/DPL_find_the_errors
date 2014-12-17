class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # Redirected properly. It was 'redirect_to @tasks'
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      # This was not being directed to the right place. I redirected to "tasks_path"
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
  # Method was undefined, and was pluralized, deleted the 's'.
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      # Added description to the permit
      params.require(:task).permit(:description, :priority)
    end
end
