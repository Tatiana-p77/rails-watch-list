class ListsController < ApplicationController
  # voir toutes les listes
  def index
    @lists = List.all
  end

  # voir détails d'une liste
  def show
    @list = List.find(params[:id])
  end

  # afficher FORMULAIRE création d'une liste
  def new
    @list = List.new
  end

  # créer une nouvelle liste
  # def create
  #   @list = List.new(list_params)
  #   @list.save!

  #   redirect_to list_path(@list)
  # end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
