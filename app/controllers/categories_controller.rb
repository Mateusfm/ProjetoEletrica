class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, only: [:edit, :update, :destroy, :new, :create, :index]
  
  def index
    authorize Category
    @categories = Category.all
  end

  
  def show
  end

  
  def new
    authorize Category
    @category = Category.new
  end

  
  def edit
    authorize @category
  end

  
  def create
    @category = Category.new(category_params)

    authorize @category

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|

    authorize @category

      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    authorize @category

    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_category
      @category = Category.find(params[:id])
    end

   
    def category_params
      params.require(:category).permit(:name)
    end
end
