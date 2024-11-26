class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end



  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(params[task_params])
    @task.save
    redirect_to task_path(@task), notice: 'Tâche créée avec succès.'
  end

  def show
    @task = Task.find(params[:id])
  end

  private

def task_params
  params.require(:task).permit(:title, :details, :completed)
end

end
