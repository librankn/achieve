class RecordsController < ApplicationController
  include SessionsHelper
  before_action :check_login
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  def index
    @records = Record.all
  end

  def new
    if params[:back]
      @record = Record.new(record_params)
    else
      @record = Record.new
    end
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to records_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
        @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to records_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @record.destroy
    redirect_to records_path, notice:"ブログを削除しました！"
  end

  def confirm
    @record = Record.new(record_params)
    render :new if @record.invalid?
  end

  private

  def record_params
    params.require(:record).permit(:title, :content)
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def check_login
    if !logged_in?
      redirect_to new_session_path
    end
  end
end
