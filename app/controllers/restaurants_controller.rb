class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
    if current_user.employee.present?
      redirect_to "/restaurant", notice: "Apenas gerentes podem editar dados cadastrais."
    end
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    if current_user.manager.present?
      flash.now[:notice] = 'Nao pode gerenciar mais de um restaurante.'
      render :new
      return
    elsif current_user.employee.present?
      flash.now[:notice] = 'Ja e funcionario em um restaurante.'
      render :new
      return
    end

    @restaurant = Restaurant.new(restaurant_params)
    manager = Manager.new
    manager.user = current_user
    @restaurant.manager = manager
    
    respond_to do |format|
      if @restaurant.save
        manager.save
        current_user.restaurant = @restaurant
        current_user.save
        format.html { redirect_to "/restaurant", notice: 'Restaurante criado com sucesso.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        flash.now[:notice] = 'Campos obrigatorios em branco.'
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurante atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile
    if user_signed_in? and current_user.restaurant.present?
      @restaurant = current_user.restaurant
      render :show
    else
      redirect_to root_path
    end
  end

  def book
    @bookings = current_user.restaurant.items.first.bookings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :telephone, :email, :address, :food_type)
    end
end
