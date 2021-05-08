class MaterialsController < ApplicationController
  before_action :set_project
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET projects/1/materials
  def index
    sessionStorage[:sort] = params[:sort]
    @materials = @project.materials.order(params[:sort])
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

    @material.total_cost = @material.quantity * @material.per_unit_price
    @material.project.total_expense = @material.project.total_expense + @material.total_cost
    if @material.save
      @material.project.save
      redirect_to(@material.project)
    else
      render action: 'new'
    end
  end

  # PUT projects/1/materials/1
  def update
    @material.project.total_expense = @material.project.total_expense - @material.total_cost

    if @material.update(material_params)
      @material.project.total_expense = @material.project.total_expense + @material.total_cost
      @material.project.save
      redirect_to(@material.project)
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/materials/1
  def destroy
    @material.project.total_expense = @material.project.total_expense - @material.total_cost
    @material.project.save
    @material.destroy

    redirect_to @project
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
