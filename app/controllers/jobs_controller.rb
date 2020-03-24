class JobsController < ApplicationController
  def index
  	@jobs = Job.all
  end

  def new
  end
  def create
  	@job = Job.create(job_params)
  	if @job.valid?
  		redirect_to "/jobs", alert: "Job Added"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to "/jobs/new"
  	end
  end

  def edit
  	@job = Job.find_by(id: params[:id])
  end
  def update
  	@job = Job.find_by(id: params[:id])
  	if @job.update(edit_params)
  		redirect_to "/jobs"
  	else
  		flash[:errors] = @job.errors.full_messages
  		redirect_to "/jobs/#{@job.id}/edit" 
  	end
  end
  private
  def job_params
  	params.require(:job).permit(:company, :description, :estimate).merge(user: current_user, completed: false)
  end
  def edit_params
  	params.require(:job).permit(:company, :description, :estimate, :billed, :paid, :completed)
  end
end
