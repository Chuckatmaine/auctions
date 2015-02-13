class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update, :new]
  before_action :authenticate_auctioneer!, only: [:index, :edit, :update, :new]
  before_action :authenticate_admin!, only: [:destroy]

  # GET /items
  # GET /items.json
  def index
     @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @auction = Auction.find(params[:auction])
    @item.qty = 1
    @item.bids.build
  end

  def newbid
    @item = Item.find(params[:id])
    @bid = @item.bids.build
    @bid.item_id = @item.id
    bids = @item.bids
    @minbid = bids.maximum("amount") + @item.bid_increment
  end

  # GET /items/1/edit
  def edit
    @auction = Auction.find(params[:auction])
    @oldseq = Item.find(params[:id]).seq
  end

  # POST /items
  # POST /items.json
  def create

    @item = Item.new(item_params)
    #@item.user_id = current_user.id 
    if !@item.buyitnow 
      @item.qty = 1; 
    end
    if @item.seq.blank? 
       @item.seq = Item.maximum("seq") + 1
    else 
        @items = @item.auction.items.all
        @items.each do |i|
          if i.seq >= @item.seq 
            i.seq += 1 
          end
        end
    end
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      @list = @item.auction.items.all
      temp = Item.new(item_params)
      item = Item.find_by seq: @item.seq, id: @item.id #Item sequence was changed and collides
     # logger.info {">>>>>item   #{item.id} #{item.seq} temp #{temp.seq}  <<<<"}
      @list.each do |l|
     # logger.info {">>>>>   #{item.seq}  #{temp.seq}  <<<<"}
            if item.seq > temp.seq   # dir = up
              if ((l.seq < item.seq) && (l.seq >= temp.seq)) 
                  l.seq += 1 
                  l.save
              end
             else  # dir = down
              if ((l.seq > item.seq) && (l.seq <= temp.seq)) 
                  l.seq -= 1 
                  l.save
              end
             end
      end
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    if @item.destroy
      respond_to do |format|
        format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to items_url, notice: 'Item can not be destroyed! Already has bids.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :seq, :description, :start_bid, :bid_increment, :auction_id, :is_donation, :buyitnow, :picture, :qty, :value, auctions_attributes:[:id], bids_attributes:[:item_id, :user_id, :id, :amount, :qty])
    end
end
