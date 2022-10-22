class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # TODO: Popular book suggestions by reviews
  end
end
