class StoresController < ApplicationController
  before_action :find_store, only: [:edit, :update, :destroy, :comment]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      # success
      redirect_to stores_path, notice: "新增成功!"
    else
      # fail
      render :new
    end
  end

  def edit
  end

  def update

    if @store.update(store_params)
      # 成功
      redirect_to stores_path, notice: "資料更新成功!"
    else
      # 失敗
      render :edit
    end
  end

  def destroy
    @store.destroy if @store
    redirect_to stores_path, notice: "候選人資料已刪除!"
  end

  def comment
    5.times {p '>>>>>>>'}
    p @store
    p request.remote_ip
    @store.comments.create(ip_address: request.remote_ip) if @store
    @store.save
    redirect_to stores_path, notice: "完成投票!"
  end






  private
  def store_params
    params.require(:store).permit(:name, :address, :introduction)
  end

  def find_store
    @store = Store.find_by(id: params[:id])
  end
end
