class CoinratesController < ApplicationController
  before_action :set_coinrate, only: [:show, :edit, :update, :destroy]

  # GET /coinrates
  # GET /coinrates.json
  def index
     @rateclasses=Rateclass.all
    @coinrates = Coinrate.all
  end

  # GET /coinrates/1
  # GET /coinrates/1.json
  def show
  end

  # GET /coinrates/new
  def new
     @rateclasses=Rateclass.all
    @coinrate = Coinrate.new
  end

  # GET /coinrates/1/edit
  def edit
    @rateclasses=Rateclass.all
  end

  # POST /coinrates
  # POST /coinrates.json
  def create
     @rateclasses=Rateclass.all
    @coinrate = Coinrate.new(coinrate_params)

    respond_to do |format|
      if @coinrate.save
        format.html { redirect_to exchanges_path, notice: 'La cotizacion se ha creado con exito.' }
        format.json { render :show, status: :created, location: @coinrate }
      else
        format.html { render :new }
        format.json { render json: @coinrate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coinrates/1
  # PATCH/PUT /coinrates/1.json
  def update
    respond_to do |format|
      if @coinrate.update(coinrate_params)
        format.html { redirect_to exchanges_path, notice: 'La cotizacion se ha modificado con exito.' }
        format.json { render :show, status: :ok, location: @coinrate }
      else
        format.html { render :edit }
        format.json { render json: @coinrate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coinrates/1
  # DELETE /coinrates/1.json
  def destroy
    @coinrate.destroy
    respond_to do |format|
      format.html { redirect_to exchanges_path, notice: 'La cotizacion se ha eliminado con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coinrate
      @coinrate = Coinrate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coinrate_params
      params.require(:coinrate).permit(:sale, :buy, :todate, :ratetype_id)
    end
end
