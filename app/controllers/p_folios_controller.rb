class PFoliosController < ApplicationController
  def index
    @portfolio_items = PFolio.all
  end

  def show
    @portfolio_item = PFolio.find(params[:id])
  end

  def new
    @portfolio_item = PFolio.new
  end

  def create
    @portfolio_item = PFolio.new(params.require(:p_folio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to p_folios_path, notice: "Your Portfolio item now created." }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
      end
    end
  end

  def edit 
    @portfolio_item = PFolio.find(params[:id])
  end

  def update
    @portfolio_item = PFolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:p_folio).permit(:title, :subtitle, :body))
        format.html { redirect_to p_folios_path, notice: "Portfolio record was successfully updated." }
      else
        format.html { render :edit}
      end
    end
  end

end
