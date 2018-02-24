class StatementsController < ApplicationController
  def index
  end

  def new
   @statement = Statement.new
  end

  def show
    @statement = Statement.find(params[:id])
  end

  def create
    @statement = Statement.create(statement_params)
    redirect_to @statement
  end

  private

  def statement_params
    params.require(:statement).permit(:evidence, :image)
  end

end
