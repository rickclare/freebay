class BidsController < ApplicationController

  before_action :load_listing

  def new
    if @listing.ended?
      flash[:notice] = "Listing has ended"
      redirect_to root_path and return
    end

    @bid = Bid.new(listing: @listing, user: current_user)
  end

  def create
    @listing.lock!

    # don't use `@listing.bids.build` since we don't want `@listing` to be aware of
    # unsaved bids
    @bid = Bid.new bid_params.merge(listing: @listing, user: current_user)
    if @bid.save
      flash[:notice] = "Your bid was successful - you're the highest bidder!"
      redirect_to root_path
    else
      flash[:error] = @bid.errors.full_messages.to_sentence
      render 'new'
    end
  end

  private

    def load_listing
      @listing = Listing.find(params[:listing_id])
    end

    def bid_params
      params.require(:bid).permit(:amount)
    end
end
