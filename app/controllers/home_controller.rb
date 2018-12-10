class HomeController < ApplicationController

  def index
    @pratos = Item.all.order(:dish_date)
  end

  def login
  end

  def about
  end

  def search
    @pratos = Item.all.where("lower(food_type) LIKE CONCAT('%',?,'%') OR lower(description) LIKE CONCAT('%',?,'%') OR lower(name) LIKE CONCAT('%',?,'%') OR cast(price as varchar(20)) LIKE CONCAT('%',?,'%')", params[:search].downcase, params[:search].downcase, params[:search].downcase, params[:search])
    render "index.html.erb"
  end

  def prato
    @prato = Item.find(params[:id])
  end

  def comment
    @prato = Item.find(params[:id])
    comment = Comment.new
    comment.item = @prato
    comment.comment = params[:comment]
    comment.user = current_user
    if comment.save
      respond_to do |format|
        format.html { render "prato.html.erb", notice: "Comentario salvo com sucesso." }
      end
    else
      respond_to do |format|
        format.html { render "prato.html.erb", notice: "Erro ao salvar o comentario." }
      end
    end
  end

  def like
    prato = Item.find(params[:id])
    like = Like.new
    like.item = prato
    like.user = current_user
    if like.save
      respond_to do |format|
        format.html { redirect_to "/prato/#{prato.id}" }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/prato/#{prato.id}" }
      end
    end
  end

  def book
    @prato = Item.find(params[:id])
    book = Booking.new
    book.item = @prato
    book.user = current_user
    
    if book.save
      redirect_to "/prato/#{prato.id}"
    else
      redirect_to root_path
    end
  end
end
