class TradesController < ApplicationController

  def index
    @trades = Trade.where(user_id: current_user.id)
  end

  def create
    @book = Book.find(params[:book_id])
    @trade = Trade.new(trades_params)
    @trade.book = @book
    @trade.user = current_user
    if @trade.save
      @book.available = false
      @book.save!
      redirect_to book_path(@book)
      # ou redirecionar para o index de trades deste usuario
    else
      flash[:notice] = "msg qualquer"
      render "books/show"
    end
  end

  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
    redirect_to books_path, status: :see_other
  end

  private

  def trades_params
    params.require(:trade).permit(:return_date, :trade_date)
  end
end
