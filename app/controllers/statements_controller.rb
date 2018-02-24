class StatementsController < ApplicationController
  def index
  end

  def new
   @statement = Statement.new
  end

  def create
    @statement = Statement.create(statement_params)
    p @statement
    p @statement.save

    redirect_to @statement
  end

  private

  def statement_params
    params.require(:statement).permit(:evidence, :image)
  end

end
