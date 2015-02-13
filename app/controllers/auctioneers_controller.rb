class AuctioneersController < ApplicationController
  before_action :set_auctioneer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update, :new]
  before_action :authenticate_admin!, only: [:index, :destroy]
  before_action :authenticate_auctioneer!, only: [:edit, :update, :new]

  # GET /auctioneers
  # GET /auctioneers.json
  def index
    if current_user.is_admin
      @auctioneers = Auctioneer.all
    else
      flash[:notice] = "You must be an admin to access that link."
    end
  end

  # GET /auctioneers/1
  # GET /auctioneers/1.json
  def show
  end

  # GET /auctioneers/new
  def new
    @auctioneer = Auctioneer.new
  end

  # GET /auctioneers/1/edit
  def edit
  end

  # POST /auctioneers
  # POST /auctioneers.json
  def create
    @auctioneer = Auctioneer.new(auctioneer_params)
    #@auctioneer = current_user.auctioneers.build(:auction_id => params[:auction_id])
    respond_to do |format|
      if @auctioneer.save
        format.html { redirect_to @auctioneer, notice: 'Auctioneer was successfully created.' }
        format.json { render :show, status: :created, location: @auctioneer }
      else
        format.html { render :new }
        format.json { render json: @auctioneer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctioneers/1
  # PATCH/PUT /auctioneers/1.json
  def update
    respond_to do |format|
      if @auctioneer.update(auctioneer_params)
        format.html { redirect_to @auctioneer, notice: 'Auctioneer was successfully updated.' }
        format.json { render :show, status: :ok, location: @auctioneer }
      else
        format.html { render :edit }
        format.json { render json: @auctioneer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctioneers/1
  # DELETE /auctioneers/1.json
  def destroy
    @auctioneer.destroy
    respond_to do |format|
      format.html { redirect_to auctioneers_url, notice: 'Auctioneer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auctioneer
      @auctioneer = Auctioneer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auctioneer_params
      params.require(:auctioneer).permit(:user_id, :auction_id, :create, :destroy)
    end
end
