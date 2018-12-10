class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @restaurant_menus = RestaurantMenu.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.restaurant = current_user.restaurant if current_user.manager.present?
    @item.restaurant = current_user.employee.restaurant if current_user.employee.present?


    respond_to do |format|
      if @item.save
        format.html { redirect_to "/item", notice: 'Prato criado com sucesso.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to "/item", notice: 'Prato atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :profile }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile
    if user_signed_in? and current_user.restaurant.present?
      @items = current_user.restaurant.items.all.order(:id)
      @restaurant_menus = current_user.restaurant.restaurant_menus.all.order(:id)
      @restaurant = current_user.restaurant
      render "index.html.erb"
    elsif user_signed_in? and current_user.employee.present?
      @items = current_user.employee.restaurant.items.all.order(:id)
      @restaurant_menus = current_user.employee.restaurant.restaurant_menus.all.order(:id)
      @restaurant = current_user.employee.restaurant
      render "index.html.erb"
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :dish_date, :food_type, :price, :restaurant_menu, :avatar)
    end
end
