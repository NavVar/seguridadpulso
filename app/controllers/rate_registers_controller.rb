class RateRegistersController < ApplicationController
  before_action :set_rate_register, only: [:show, :edit, :update, :destroy]
  before_action :admin_user
  # GET /rate_registers
  # GET /rate_registers.json
  def index
    @rate_registers = RateRegister.all
  end

  # GET /rate_registers/1
  # GET /rate_registers/1.json
  def show
  end

  # GET /rate_registers/new
  def new
    @rate_register = RateRegister.new
  end

  # GET /rate_registers/1/edit
  def edit
  end

  # POST /rate_registers
  # POST /rate_registers.json
  def create
    @rate_register = RateRegister.new(rate_register_params)

    respond_to do |format|
      if @rate_register.save
        format.html { redirect_to DevelopmentRate.find(@rate_register.development_rate_id), notice: 'Rate register was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @rate_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rate_registers/1
  # PATCH/PUT /rate_registers/1.json
  def update
    respond_to do |format|
      if @rate_register.update(rate_register_params)
        format.html { redirect_to @rate_register, notice: 'Rate register was successfully updated.' }
        format.json { render :show, status: :ok, location: @rate_register }
      else
        format.html { render :edit }
        format.json { render json: @rate_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rate_registers/1
  # DELETE /rate_registers/1.json
  def destroy
    @development_rate=@rate_register.development_rate_id
    @rate_register.destroy
    respond_to do |format|
      format.html { redirect_to '/development_rates/'+@development_rate.to_s+'/edit', notice: 'Rate register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate_register
      @rate_register = RateRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_register_params
      params.require(:rate_register).permit(:rate_value, :date_registered,:country_id,:development_rate_id)
    end

    def admin_user
      if user_signed_in?
        redirect_to '/denial' unless current_user.has_role? :admin
      else
        redirect_to '/denial'
      end
    end
end
