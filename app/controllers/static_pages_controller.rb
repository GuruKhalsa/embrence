class StaticPagesController < ApplicationController
  
  def home
  	@heroes = Hero.all(:order => 'RAND()', :limit => 12)
  end
  
  def faq
  end

  def contact
  end

end