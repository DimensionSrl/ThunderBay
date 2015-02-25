class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.all
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /apps.json
  def create
    if params[:app][:certificate] 
      p12_cert_path = 'uploads/' + params[:app][:certificate].original_filename
      File.open(p12_cert_path, "wb") do |f|
        f.write(params['app']['certificate'].tempfile.read)
      end
      pem_cert_path = p12_cert_path.gsub(/.p12$/,'.pem')
      passwd = params['app'][:password]
      passwd ||= ''
      # Converts certificate using password in db or ''
      system("openssl pkcs12 -in #{p12_cert_path} -out #{pem_cert_path} -nodes -clcerts -password pass:#{passwd}")
      # openssl pkcs12 -in altimeter.p12 -out altimeter.pem -nodes -clcerts -password pass:
      if File.exists?(pem_cert_path)
        certificate = File.open(pem_cert_path, 'rb').read
        if certificate
          info = certificate.match(/UID=(.+)\/CN=/)
          if info
            key = info[0].gsub!("UID=", "").gsub!("/CN=", "") if info
          else 
            "Failed extracting informations"
            redirect_to new_app_path
            return
          end
        else 
          "Failed converting Certificate"
          redirect_to new_app_path
          return
        end
      else
        "Failed uploading Certificate"
        redirect_to new_app_path
        return
      end
    else
      redirect_to new_app_path
      return
    end
    identifier = Digest::SHA1.hexdigest('#acapulco' + Time.now.to_s + '$-lldfghsagsdwpa.K099123##')
  
    environment = "production"
    if params[:app][:sandbox] == "1"
      environment = "sandbox"
    end
    
    @app = App.new(:key => key, :certificate => certificate, :identifier => identifier[0..15], :environment => environment)

    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:key, :identifier, :environment, :password, :certificate, :sandbox)
    end
end
