class StatementsController < ApplicationController
  before_action :set_statement, only: [:show, :edit, :update, :destroy]

  def index
    @statements = Statement.all
  end

  def new
   @statement = Statement.new
  end

  def show
  end

  def edit
  end

  def update
    @statement.update(statement_params)
    flash[:success] = 'Evidence changed mate'
    redirect_to @statement
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

  def destroy
    @statement.destroy
    flash[:success] = 'Evidence destroyed'
    redirect_to statements_path
  end

  private

  def statement_params
    params.require(:statement).permit(:evidence, :image)
  end

  def set_statement
    @statement = Statement.find(params[:id])
  end

  def get_errors(object)
    message_chain = ''
    object.errors.messages.each_value { |section|
      section.each { |issue|  message_chain += issue.to_s }
    }
    message_chain
  end


end
