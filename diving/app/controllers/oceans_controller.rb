class OceansController < ApplicationController
  before_action :set_ocean, only: [:show, :edit, :update, :destroy]

  # GET /oceans
  # GET /oceans.json
  def index
    @oceans = Ocean.all
  end

  # GET /oceans/1
  # GET /oceans/1.json
  def show
  end

  # GET /oceans/new
  def new
    @ocean = Ocean.new
  end

  # GET /oceans/1/edit
  def edit
  end

  # POST /oceans
  # POST /oceans.json
  def create
    @ocean = Ocean.new(ocean_params)

    respond_to do |format|
      if @ocean.save
        format.html { redirect_to @ocean, notice: 'Ocean was successfully created.' }
        format.json { render :show, status: :created, location: @ocean }
      else
        format.html { render :new }
        format.json { render json: @ocean.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oceans/1
  # PATCH/PUT /oceans/1.json
  def update
    respond_to do |format|
      if @ocean.update(ocean_params)
        format.html { redirect_to @ocean, notice: 'Ocean was successfully updated.' }
        format.json { render :show, status: :ok, location: @ocean }
      else
        format.html { render :edit }
        format.json { render json: @ocean.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oceans/1
  # DELETE /oceans/1.json
  def destroy
    @ocean.destroy
    respond_to do |format|
      format.html { redirect_to oceans_url, notice: 'Ocean was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ocean
      @ocean = Ocean.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ocean_params
      params.fetch(:ocean, {})
    end
end
