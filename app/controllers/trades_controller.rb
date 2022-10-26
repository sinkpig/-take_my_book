class TradesController < ApplicationController

  def index
    @trades = Trade.where(user_id: current_user.id)
  end

  def new
    #criar este formulario na show de book (nome e endereço e data de retorno)
    @trade = Trade.new
  end

  def create
    book = Book.find(params[:book_id])
    @trade = Trade.new(trades_params)
    if @trade.save
      redirect_to book_path(book)
      # ou redirecionar para o index de trades deste usuario
      book.available = false
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
    redirect_to books_path, status: :see_other
  end

  private

  def trade_params
    params.require(:trade).permit(:user_id, :book_id)
  end
end
