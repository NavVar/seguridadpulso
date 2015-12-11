class RatetypesController < ApplicationController
  before_action :set_ratetype, only: [:show, :edit, :update, :destroy]

  # GET /ratetypes
  # GET /ratetypes.json
  def index
    @ratetypes = Ratetype.all
  end

  # GET /ratetypes/1
  # GET /ratetypes/1.json
  def show
  end

  # GET /ratetypes/new
  def new
    @ratetype = Ratetype.new
  end

  # GET /ratetypes/1/edit
  def edit
  end
def new_rate
  end
  # POST /ratetypes
  # POST /ratetypes.json

  def create
    @ratetype = Ratetype.new(ratetype_params)

    respond_to do |format|
      if @ratetype.save
        format.html { redirect_to ratetypes_path, notice: 'Clase de elemento creada exitosamente'  }
        format.json { render :show, status: :created, location: @ratetype }
      else
        format.html { render :new }
        format.json { render json: @ratetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratetypes/1
  # PATCH/PUT /ratetypes/1.json
  def update
    respond_to do |format|
      if @ratetype.update(ratetype_params)
        format.html { redirect_to ratetypes_path, notice: 'Ratetype was successfully updated.' }
        format.json { render :show, status: :ok, location: @ratetype }
      else
        format.html { render :edit }
        format.json { render json: ratetypes_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratetypes/1
  # DELETE /ratetypes/1.json
  def destroy
    @ratetype.destroy
    respond_to do |format|
      format.html { redirect_to ratetypes_url, notice: 'Ratetype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ratetype
      @ratetype = Ratetype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ratetype_params
      params.require(:ratetype).permit(:name, :unit, :rateclass_id)
    end
end
