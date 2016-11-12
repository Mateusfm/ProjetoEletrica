class HomeController < ApplicationController
   def index
      @offerings = Offering.all
   end
end
