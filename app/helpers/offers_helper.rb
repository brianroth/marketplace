module OffersHelper
  def offer_type(offer)
    if offer.new_record?
      "New"
    else
      "Edit"
    end
  end
  
  def editable?(offer)
    session[:user_id] == offer.user_id
  end
end
