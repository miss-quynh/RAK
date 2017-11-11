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

	#visible to signed-in organizations
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
		@organization = Organization.find(params[:organization_id])
		@project.organization = @organization
		
		if project_params[:event]
			@project.event = Event.find_or_create_by(name: project_params[:event])
		end

	  if @project.save
	  	render json: @project
	  else
	  	@errors = @project.errors.full_messages
	  	render json: @errors, status: 406
	  end 
	end

	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			if project_params[:event] != @project.event.event_name
				@project.event = Event.find_or_create_by(name: project_params[:event])
			elsif !project_params[:event]
				@project.event = nil
			end
			
			render json: @project {project: @project, event: @project.event.event_name}
		else
			@errors = @project.errors.full_messages
	  	render json: @errors, status: 406
		end 
	end 

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		render status: 200
	end 

	private
	
	def project_params
		params.require(:project).permit(:project_name, :street_address, :city, :state, :zip_code, :description, :event)
	end

end
