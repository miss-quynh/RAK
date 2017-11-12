class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all.order(:id)
    render json: @organizations
  end

  def show
    @organization = Organization.find(params[:id])
    @organization_projects = @organization.projects
    render json: {organization: @organization, projects: @projects, category: @organization.category}
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization
    else
      render json: {status: "error", code: 406, message: 'The account was not successfully created.'}
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    render json: @organization
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update(organization_params)
      render json: @organization
    else
      render json: {status: "error", code: 406, message: @organizations.errors.full_messages}
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:organization_name, :tax_code, :email, :password, :password_confirmation)
  end

end
