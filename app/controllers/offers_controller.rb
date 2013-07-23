class OffersController < ApplicationController
  before_filter :find_offer, :only => [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.active.includes(:plane, :part, :user).paginate(:page => params[:page])
  end

  def new
    @offer = Offer.new
  end

  def edit
    redirect_to offers_path, :notice => "You cannot edit that offer" unless session[:user_id] == @offer.user_id
  end

  def create
    @offer = Offer.new(params[:offer].merge(:active => true, :user_id => session[:user_id]))

    if @offer.save
      redirect_to @offer, :notice => 'Offer was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if @offer.update_attributes(params[:offer])
      redirect_to @offer, :notice => 'Offer was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    if session[:user_id] == @offer.user_id
      @offer.destroy 
      notice = "Offer successfully destroyed"
    else
      notice = "You cannot delete an offer that doesn't belong to you"
    end
    redirect_to offers_url, :notice => notice
  end

  private
  def find_offer
    if @offer = Offer.active.find_by_id(params[:id])
      true
    else
      redirect_to offers_path, :notice => "Offer not found"
      false
    end
  end
end
