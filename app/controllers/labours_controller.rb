class LaboursController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_labour, only: [:show, :edit, :update, :destroy]

  # GET projects/1/labours
  def index
    @labours = @project.labours
  end

  # GET projects/1/labours/1
  def show
  end

  # GET projects/1/labours/new
  def new
    @labour = @project.labours.build
  end

  # GET projects/1/labours/1/edit
  def edit
  end

  # POST projects/1/labours
  def create
    @labour = @project.labours.build(labour_params)

    @labour.project.total_expense = @labour.project.total_expense + @labour.weekly_expense
    if @labour.save
      @labour.project.save
      redirect_to(@labour.project)
    else
      render action: 'new'
    end
  end

  # PUT projects/1/labours/1
  def update
    @labour.project.total_expense = @labour.project.total_expense - @labour.weekly_expense

    if @labour.update(labour_params)
      @labour.project.total_expense = @labour.project.total_expense + @labour.weekly_expense
      @labour.project.save
      redirect_to(@labour.project)
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/labours/1
  def destroy

    @labour.project.total_expense = @labour.project.total_expense - @labour.weekly_expense
    @labour.project.save
    @labour.destroy

    redirect_to @project
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_labour
      @labour = @project.labours.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def labour_params
      params.require(:labour).permit(:weekend_date, :weekly_expense, :project_id)
    end
end
