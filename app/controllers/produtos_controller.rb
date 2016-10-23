class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, only: [:edit, :update, :destroy, :new, :create]


  def index
    @q = Produto.ransack(params[:q])
    @produtos = @q.result(distinct: true)   
  end


  def show
	
  end

  
  def new
      authorize Produto
      @produto = Produto.new
    
  end


  def edit
    authorize @produto
  end

 
  def create
    @produto = Produto.new(produto_params)

    authorize @produto

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto criado com sucesso!' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|

      authorize @produto

      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy

    authorize @produto

    @produto.destroy

    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome, :descricao, :photo, :category_id)
    end
end
