class DevicesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    app_id = ""
    if params[:app_id]
      @app = App.where(:identifier => params[:app_id]).first
      if @app
        app_id = @app.id
      end
    elsif params[:device][:app_id]
      @app = App.where(:identifier => params[:device][:app_id]).first
      if @app
        app_id = @app.id
      end
    end

    @device = Device.where(:identifier => params[:device][:identifier], :token => params[:device][:token], :app_id => app_id).first
    if @device
      @device.update(device_params)
    else 
      @device = Device.new(device_params)
    end
    
    @device.app_id = app_id
    @device.last_access = Time.new
    
    respond_to do |format|
      if @device.save
        format.json { render :show, status: :created, location: @device }
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
      else
        format.json { render json: @device.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:identifier, :token, :app_id, :last_access, :lat, :lon, :locale, :name)
    end
end
