class TradesController < ApplicationController
  #todo def index pra mostrar quantas vezes o livro ja foi emprestado (e assim criar-se um ranking com os livros mais populares)

  def new
    #todo colocar este form dentro da show do book
    @trade = Trade.new
  end

  def create
    book = Book.find(params[:book_id])
    @trade = Trade.new(trades_params)
    redirect_to book_path(book)
  end

    #todo do we needs a def destroy here? se eu como user quiser cance;ar o emprestimo

  private

  def trade_params
    params.require(:trade).permit(:user_id, :book_id)
  end
end
