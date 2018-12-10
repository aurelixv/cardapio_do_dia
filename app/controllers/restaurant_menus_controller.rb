class RestaurantMenusController < ApplicationController
  before_action :set_restaurant_menu, only: [:show, :edit, :update, :destroy]

  # GET /restaurant_menus
  # GET /restaurant_menus.json
  def index
    @restaurant_menus = RestaurantMenu.all
  end

  # GET /restaurant_menus/1
  # GET /restaurant_menus/1.json
  def show
  end

  # GET /restaurant_menus/new
  def new
    @restaurant_menu = RestaurantMenu.new
  end

  # GET /restaurant_menus/1/edit
  def edit
  end

  # POST /restaurant_menus
  # POST /restaurant_menus.json
  def create
    @restaurant_menu = RestaurantMenu.new(restaurant_menu_params)
    @restaurant_menu.restaurant = current_user.restaurant if current_user.manager.present?
    @restaurant_menu.restaurant = current_user.employee.restaurant if current_user.employee.present?

    respond_to do |format|
      if @restaurant_menu.save
        format.html { redirect_to "/item", notice: 'Cardapio criado com sucesso.' }
        format.json { render :show, status: :created, location: @restaurant_menu }
      else
        format.html { render :new }
        format.json { render json: @restaurant_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_menus/1
  # PATCH/PUT /restaurant_menus/1.json
  def update
    respond_to do |format|
      if @restaurant_menu.update(restaurant_menu_params)
        format.html { redirect_to "/item", notice: 'Cardapio atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @restaurant_menu }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_menus/1
  # DELETE /restaurant_menus/1.json
  def destroy
    @restaurant_menu.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_menus_url, notice: 'Restaurant menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_menu
      @restaurant_menu = RestaurantMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_menu_params
      params.require(:restaurant_menu).permit(:name, :description)
    end
end
