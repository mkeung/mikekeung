class ProjectsController < ApplicationController
	before_action :admin_user, only: [:create, :destroy, :edit, :update]

	def index
		@projects = Project.all
		@new_project = Project.new
	end

	def create
		@project = Project.new(project_params)
	    if @project.save
	    	flash[:success] = "project added"
	    	redirect_to projects_path
	    else
	      render 'index'
	    end
	end

	def destroy
		Project.find(params[:id]).destroy
    	flash[:success] = "project deleted"
    	redirect_to projects_path
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
	      flash[:success] = "program updated"
	      redirect_to projects_path
	    else
	      render 'edit'
	    end
	end

	private
		def project_params
			params.require(:project).permit(:title, :description,
					:learning, :github, :external_link, :completed)
		end
end