class PFoliosController < ApplicationController
  def index
    @portfolio_items = PFolio.all
  end



end
