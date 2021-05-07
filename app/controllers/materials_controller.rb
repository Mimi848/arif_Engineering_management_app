class MaterialsController < ApplicationController
  before_action :set_project
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET projects/1/materials
  def index
    @materials = @project.materials
  end

  # GET projects/1/materials/1
  def show
  end

  # GET projects/1/materials/new
  def new
    @material = @project.materials.build
  end

  # GET projects/1/materials/1/edit
  def edit
  end

  # POST projects/1/materials
  def create
    @material = @project.materials.build(material_params)

    if @material.save
      redirect_to([@material.project, @material], notice: 'Material was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT projects/1/materials/1
  def update
    if @material.update_attributes(material_params)
      redirect_to([@material.project, @material], notice: 'Material was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/materials/1
  def destroy
    @material.destroy

    redirect_to project_materials_url(@project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_material
      @material = @project.materials.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def material_params
      params.require(:material).permit(:name, :purchase_date, :per_unit_price, :quantity, :total_cost, :category, :project_id)
    end
end
