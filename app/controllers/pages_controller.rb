class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # TODO: Popular book suggestions by reviews
    @books = Book.last(4).reverse
  end

  def profile
    @trades = current_user.trades
  end
end
