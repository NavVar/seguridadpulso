class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:show, :edit, :update, :destroy]

  # GET /exchanges
  # GET /exchanges.json
  def index
    @flag=false
    @element=""
     if params[:search]
      @element=params[:search]
      @flag=true
      @coinrates= Coinrate.joins([:ratetype]).where("name LIKE ? ", "#{params[:search]}%").order(todate: :desc).paginate(:page => params[:page], :per_page => 8)
      @exchanges = Exchange.joins([:ratetype]).where("name LIKE ? ", "#{params[:search]}%").order(to_date: :desc).paginate(:page => params[:page], :per_page => 8)
    else
      @flag=false
      @exchanges = Exchange.all.order(to_date: :desc).paginate(:page => params[:page], :per_page => 8)
      @coinrates= Coinrate.all.order(todate: :desc).paginate(:page => params[:page], :per_page => 8)
    end
  end

  # GET /exchanges/1
  # GET /exchanges/1.json
  def show
  end

  # GET /exchanges/new
  def new
    @exchange = Exchange.new
    @coinrate= Coinrate.new
    @id_moneda=""
    @rateclasses=Rateclass.all
  end

  # GET /exchanges/1/edit
  def edit
  end

  # POST /exchanges
  # POST /exchanges.json
  def create
    @exchange = Exchange.new(exchange_params)

    respond_to do |format|
      if @exchange.save
        format.html { redirect_to exchanges_path, notice: 'La cotizacion de elemento se creó con exito. ' }
        format.json { render :show, status: :created, location: @exchange }
      else

        format.html { render :edit }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exchanges/1
  # PATCH/PUT /exchanges/1.json
  def update
    respond_to do |format|
      if @exchange.update(exchange_params)
        format.html { redirect_to exchanges_path, notice: 'La cotizacion de elemento se modificó con exito.' }
        format.json { render :show, status: :ok, location: @exchange }
      else
        format.html { render :edit }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exchanges/1
  # DELETE /exchanges/1.json
  def destroy
    @exchange.destroy
    respond_to do |format|
      format.html { redirect_to exchanges_url, notice: 'La cotizacion de elemento se eliminó con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange
      @exchange = Exchange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_params
      params.require(:exchange).permit(:to_date, :buy_value, :ratetype_id, :rateclass_id, :coin, :saleprice)
    end
end
