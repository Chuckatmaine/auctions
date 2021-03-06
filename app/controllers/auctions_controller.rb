class AuctionsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :destroy, :index]
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_auctioneer!, only: [:edit, :update, :new]
  before_action :authenticate_admin!, only: [:destroy]

  # GET /auctions
  # GET /auctions.json
  def home
  end
  def index
    if user_signed_in? 
      @owner = owner
    end
    if (current_user.is_admin || current_user.is_auctioneer)
      @auctions = Auction.all
    else
      @auctions = Auction.where(display: true)
    end 
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
    if user_signed_in? 
    @owner = owner 
    end
  end

  def finalize 
    @auction = Auction.find(params[:id])
    respond_to do |format|
    @auction.display = false
      if @auction.save
        items = Item.where(auction_id: @auction.id)
        winners = []
        items.each do |i|
          winners << i.highbidder
        end
        winners = winners.uniq
        winners.each do |w|
          wonitems = []
          items.each do |it| 
           if it.highbidder == w
             wonitems << it
           end
          end 
          UserMailer.won_item(@auction, wonitems, w.email)
        end
        format.html { redirect_to @auction, notice: 'Auction was successfully finalized and emails sent.' }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
    @auction.items.build
  end

  # GET /auctions/1/edit
  def edit
    if user_signed_in? 
      @owner = owner 
    end
  end

  def auction_items
    @auction = Auction.find(params[:id])
    @items = @auction.items.all.order(seq: :asc)
    if user_signed_in? 
      @owner = owner 
    end
  end 

  # POST /auctions
  # POST /auctions.json
  def create
    @auction = Auction.new(auction_params)
    @auctioneer = @auction.auctioneers.build 
    @auctioneer.user_id = current_user.id
    respond_to do |format|
      if @auction.save && @auctioneer.save
        Notifier.welcome(current_user.email).deliver
        format.html { redirect_to @auction, notice: 'Auction was successfully created.' }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctions/1
  # PATCH/PUT /auctions/1.json
  def update
    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to @auction, notice: 'Auction was successfully updated.' }
        format.json { render :show, status: :ok, location: @auction }
      else
        format.html { render :edit }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  def enter
      @auction = Auction.find(params[:id])
      @fullname = @auction.auctioneers.first.user.first_name + ' ' + @auction.auctioneers.first.user.last_name
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    @auction.destroy
    respond_to do |format|
      format.html { redirect_to auctions_url, notice: 'Auction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def owner
     if @auction
       return @auction.auctioneers.detect { |o| o["user_id"] == current_user.id }
     else return 0
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:id, :title, :description, :start_date, :end_date, :display, :winner_message, :logo, :finalized, :payment, items_attributes:[:id, :title, :description, :start_bid, :bid_increment, :auction_id, :is_donation, :buyitnow, :picture, :picture_file_name, :picture_contnet_type, :picture_file_size, :picture_updated_at, :qty, :seq, :value], bids_attributes:[:id, :user_id, :item_id, :amount, :created_at, :updated_at, :qty] )
    end
end
