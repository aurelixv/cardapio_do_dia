class HomeController < ApplicationController

  def index
    @pratos = Item.all.order(:dish_date)
  end

  def login
  end

  def about
  end

  def search
    @pratos = Item.all.where("lower(food_type) LIKE CONCAT('%',?,'%') OR lower(description) LIKE CONCAT('%',?,'%') OR lower(name) LIKE CONCAT('%',?,'%')", params[:search].downcase, params[:search].downcase, params[:search].downcase)
    render "index.html.erb"
  end

  def prato
    @prato = Item.find(params[:id])
  end

end
