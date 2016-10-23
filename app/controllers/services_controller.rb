class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, only: [:edit, :update, :destroy, :new, :create]

  def index
    @services = Service.all
  end


  def show
  end


  def new
      authorize Service
      @service = Service.new
  end


  def edit
    authorize @service
  end


  def create
    @service = Service.new(service_params)

    authorize @service

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|

    authorize @service   
  
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy

    authorize @service    

    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_service
      @service = Service.find(params[:id])
    end


    def service_params
      params.require(:service).permit(:title, :description, :photo)
    end
end
