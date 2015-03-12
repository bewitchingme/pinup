class Admin::ListsController < ApplicationController
  
  expose(:lists) { Admin::List.all }
  expose(:list, attributes: :list_params) { params[:id].nil? ? Admin::List.new : Admin::List.find(params[:id]) }

  respond_to :html

  def index
    respond_with(lists)
  end

  def show
    respond_with(list)
  end

  def new
    respond_with(list)
  end

  def edit
  end

  def create
    self.list = Admin::List.new(list_params)
    list.save
    respond_with(list)
  end

  def update
    list.update(list_params)
    respond_with(list)
  end

  def destroy
    list.destroy
    respond_with(list)
  end

  private

    def list_params
      params.require(:admin_list).permit(:title, :url)
    end

end
