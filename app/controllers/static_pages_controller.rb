class StaticPagesController < ApplicationController
  
  def home
  	@heroes = Ember.all(:order => 'RAND()', :limit => 12)
  end
  
  def faq
  end

  def about
  	@mom = Ember.friendly.find(1)
  end

end