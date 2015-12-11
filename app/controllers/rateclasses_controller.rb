class RateclassesController < ApplicationController
  before_action :set_rateclass, only: [:show, :edit, :update, :destroy]

  # GET /rateclasses
  # GET /rateclasses.json
  def index
    @rateclasses = Rateclass.all
  end

  # GET /rateclasses/1
  # GET /rateclasses/1.json
  def show
  end

  # GET /rateclasses/new
  def new
    @rateclass = Rateclass.new
  end

  # GET /rateclasses/1/edit
  def edit
  end
  def new_rate
     @rateclass = Rateclass.new
     @ratetype = Ratetype.new
  end

  # POST /rateclasses
  # POST /rateclasses.json
  
  def create
    @rateclass = Rateclass.new(rateclass_params)

    respond_to do |format|
      if @rateclass.save
        format.html { redirect_to  rateclasses_path, notice: 'Clase de elemento creada exitosamente' }
        format.json { render :show, status: :created, location: @rateclass }

      else
        format.html { render :new }
        format.json { render json: @rateclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rateclasses/1
  # PATCH/PUT /rateclasses/1.json
  def update
    respond_to do |format|
      if @rateclass.update(rateclass_params)
        format.html { redirect_to rateclasses_path, notice: 'Rateclass was successfully updated.' }
        format.json { render :show, status: :ok, location: @rateclass }
      else
        format.html { render :edit }
        format.json { render json: @rateclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rateclasses/1
  # DELETE /rateclasses/1.json
  def destroy
    @rateclass.destroy
    respond_to do |format|
      format.html { redirect_to rateclasses_url, notice: 'Rateclass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rateclass
      @rateclass = Rateclass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rateclass_params
      params.require(:rateclass).permit(:name)
    end
end
