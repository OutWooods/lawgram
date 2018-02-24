class StatementsController < ApplicationController
  def index
  end

  def new
   @statement = Statement.new
  end

  def create
    p statement_params
    @statement = Statement.new(statement_params)
    p @statement
  end

  private

  def statement_params
    params.require(:statement).permit(:evidence, :image)
  end

end
