class ProjectsController < ApplicationController

	def index
		@projects = Project.all
		render json: @projects
	end 

	#visible to signed all users
	def show 
	  @project = Project.find(params[:id])
	  render json: @project
	end 


	#visible to signed-in organisations
	def new
		@project = Project.new
		render json: @project
	end 

	def edit
		@project = Project.find(params[:id])
		render json: @project
	end 

	def create
	  @project = Project.new(project_params)

	  if @project.save
	  	render json: @project
	  else
	  	@errors = @project.errors.full_messages
	  	render json: @errors
	  end 
	end


	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			render json: @project
		else
			@errors = @project.errors.full_messages
	  		render json: @errors
		end 
	end 




	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		render status: 200
	end 


	private
		def project_params
			params.require(:project).permit(:project_name,:street_address, :city, :state, :zip_code)
		end


end