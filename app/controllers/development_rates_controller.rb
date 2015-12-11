class DevelopmentRatesController < ApplicationController
  before_action :set_development_rate, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :edit, :update, :create, :destroy]
  # GET /development_rates
  # GET /development_rates.json
  def index
    if params[:search]
      @development_rates= DevelopmentRate.search(params[:search]).order("name")
    else
      @development_rates = DevelopmentRate.all.order("name")
    end
  end

  # GET /development_rates/1
  # GET /development_rates/1.json
  def show
    @flag=nil
    if @development_rate.rate_registers.count !=0
      @countries= Country.all
      @chart = LazyHighCharts::HighChart.new('graph') do |f|
          f.title(:text => 'Evolución')
          f.subtitle(:text => @development_rate.name)
          if params["custom"]==nil
            @years=@development_rate.rate_registers.pluck(:date_registered).sort.map{|a| a.strftime('%Y')}
            @years=@years.uniq
            @initial_date = (DateTime.new(@development_rate.rate_registers.first.date_registered.year))
            @final_date = (DateTime.now.end_of_day)
          else
            @initial_date= DateTime.new(params["custom"]["initial(1i)"].to_i, params["custom"]["initial(2i)"].to_i, params["custom"]["initial(3i)"].to_i,0,0)
            @final_date= DateTime.new(params["custom"]["final(1i)"].to_i, params["custom"]["final(2i)"].to_i, params["custom"]["final(3i)"].to_i,23,59)
            if @initial_date > @final_date || DateTime.now.end_of_day < @initial_date || DateTime.now.end_of_day < @final_date
              @years=@development_rate.rate_registers.pluck(:date_registered).sort.map{|a| a.strftime('%Y')}
              @years=@years.uniq
              @flag = 1
              if DateTime.now.end_of_day < @initial_date || DateTime.now.end_of_day < @final_date
                @flag=2
              end
              @initial_date = (DateTime.new(@development_rate.rate_registers.first.date_registered.year))
              @final_date = (DateTime.now.end_of_day)
            else
              @years=@development_rate.rate_registers.where('date_registered BETWEEN ? AND ?',@initial_date, @final_date).pluck(:date_registered).sort.map{|a| a.strftime('%Y')}
              @years=@years.uniq
            end
          end
              f.xAxis(:categories => @years)
              @countries.each do |country|
                @data=Hash.new
                @rate_registers=country.rate_registers.where('development_rate_id = ? AND date_registered BETWEEN ? AND ?',@development_rate.id,@initial_date, @final_date).order('date_registered DESC').map{|a| [a.date_registered.strftime('%Y'),a.rate_value]}
                @rate_registers.each do |rate|
                  if @data[rate[0]]==nil
                    @data[rate[0]]=rate[1]
                  end
                end
                @result=Hash.new
                @years.each do |year|
                  @result[year]=@data[year]
                end
                f.series(:name => country.name, :yAxis => 0, :data=> @result.values)
              end
              f.yAxis [
                {:title => {:text => "Valor de "+@development_rate.name, :margin => 70} }]
              f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
              f.chart({:defaultSeriesType=>"column"})
              f.options[:scrollbar]={:enabled=>true}
      end
    end
  end

  # GET /development_rates/new
  def new
    @development_rate = DevelopmentRate.new
  end

  # GET /development_rates/1/edit
  def edit
    @flag = nil
    if @development_rate.rate_registers.count!=0
      if params["custom"]==nil
        @initial_date = (DateTime.new(@development_rate.rate_registers.first.date_registered.year))
        @final_date = (DateTime.now.end_of_day)
      else
        @initial_date= DateTime.new(params["custom"]["initial(1i)"].to_i, params["custom"]["initial(2i)"].to_i, params["custom"]["initial(3i)"].to_i,0,0)
        @final_date= DateTime.new(params["custom"]["final(1i)"].to_i, params["custom"]["final(2i)"].to_i, params["custom"]["final(3i)"].to_i,23,59)
        if @initial_date > @final_date || DateTime.now.end_of_day < @initial_date || DateTime.now.end_of_day < @final_date
          @flag = 1
          if DateTime.now.end_of_day < @initial_date || DateTime.now.end_of_day < @final_date
            @flag=2
          end
          @initial_date = (DateTime.new(@development_rate.rate_registers.first.date_registered.year))
          @final_date = (DateTime.now.end_of_day)
        end
      end
      @rate_registers=@development_rate.rate_registers.where('date_registered BETWEEN ? AND ?',@initial_date, @final_date).order('date_registered DESC').paginate(:page => params[:page], :per_page => 10)
    end
  end

  # POST /development_rates
  # POST /development_rates.json
  def create
    @development_rate = DevelopmentRate.new(development_rate_params)

    respond_to do |format|
      if @development_rate.save
        format.html { redirect_to @development_rate, notice: 'Development rate was successfully created.' }
        format.json { render :show, status: :created, location: @development_rate }
      else
        format.html { render :new }
        format.json { render json: @development_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /development_rates/1
  # PATCH/PUT /development_rates/1.json
  def update
    respond_to do |format|
      if @development_rate.update(development_rate_params)
        format.html { redirect_to @development_rate, notice: 'Development rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @development_rate }
      else
        format.html { render :edit }
        format.json { render json: @development_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /development_rates/1
  # DELETE /development_rates/1.json
  def destroy
    @development_rate.destroy
    respond_to do |format|
      format.html { redirect_to development_rates_url, notice: 'Development rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_development_rate
      @development_rate = DevelopmentRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def development_rate_params
      params.require(:development_rate).permit(:name, :description)
    end

    def show_params
      params.require("show").permit(:id,)
    end
    def admin_user
      if user_signed_in?
        redirect_to '/denial' unless current_user.has_role? :admin
      else
        redirect_to '/denial'
      end
    end

    def custom_params
      params.require("custom").permit(:initial, :final)
    end
end
