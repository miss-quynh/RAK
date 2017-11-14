class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all.order(:id)
    render json: @organizations
  end

  def show
    @organization = Organization.find(params[:id])
    # @closest_organizations = @organization.closest_organizations(donor_zipcode)
    @organization_projects = @organization.projects

    render json: {organization: @organization, closest_organizations: @closest_organizations, projects: @organization_projects, category: @organization.category}

  end

  def new
    @organization = Organization.new
  end

  def create
    if GuidestarSearchAdapter.verify_organization(organization_params[:ein])
      @organization = Organization.new(organization_params)
    end

    if @organization.save
      render json: @organization
    else
      render json: { error: 'The account was not successfully created. EIN invalid'}
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
      render json: {errors: @organizations.errors.full_messages}, status: 406
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:organization_name, :tax_code, :email, :password, :password_confirmation)
  end

end
