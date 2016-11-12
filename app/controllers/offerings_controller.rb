class OfferingsController < ApplicationController
  before_action :set_offering, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, only: [:edit, :update, :destroy, :new, :create, :index]

  def index
    authorize Offering
    @offerings = Offering.all
  end


  def show
  end


  def new
    authorize Offering
    @offering = Offering.new
  end


  def edit
  end


  def create
    @offering = Offering.new(offering_params)

    authorize @offering

    respond_to do |format|
      if @offering.save
        format.html { redirect_to @offering, notice: 'Offering was successfully created.' }
        format.json { render :show, status: :created, location: @offering }
      else
        format.html { render :new }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    authorize @offering

    respond_to do |format|
      if @offering.update(offering_params)
        format.html { redirect_to @offering, notice: 'Offering was successfully updated.' }
        format.json { render :show, status: :ok, location: @offering }
      else
        format.html { render :edit }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    authorize @offering

    @offering.destroy
    respond_to do |format|
      format.html { redirect_to offerings_url, notice: 'Offering was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_offering
      @offering = Offering.find(params[:id])
    end

    def offering_params
      params.require(:offering).permit(:produto_id)
    end
end
