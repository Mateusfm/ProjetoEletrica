class HomeController < ApplicationController
   def index
      @produtos = Produto.take(3)
   end
end
