class StatementsController < ApplicationController
  def index
    @statements = Statement.all
  end

  def new
   @statement = Statement.new
  end

  def show
    @statement = Statement.find(params[:id])
  end

  def create
    @statement = Statement.create(statement_params)
    if @statement.save
      flash[:success] = 'Evidence submitted'
      redirect_to @statement
    else
      flash[alert] = get_errors(@statement)
      render :new
    end
  end

  private

  def statement_params
    params.require(:statement).permit(:evidence, :image)
  end

  def get_errors(object)
    message_chain = ''
    object.errors.messages.each_value { |section|
      section.each { |issue|  message_chain += issue.to_s }
    }
    message_chain
  end

end
