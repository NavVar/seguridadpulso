class HomeController < ApplicationController

  def index
    @articles=Article.where(confirmed:true).order('created_at DESC').limit(3)
    @exchanges=Exchange.order('created_at DESC').limit(5)
    @usd=GoogCurrency.usd_to_bob(1)
    @eur=GoogCurrency.eur_to_bob(1)
  end
  def about_us
  end
  def contact_us
  end
  def denial
  end
end
