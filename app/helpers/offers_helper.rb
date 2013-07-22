module OffersHelper
  def offer_type(offer)
    if offer.new_record?
      "New"
    else
      "Edit"
    end
  end
end
