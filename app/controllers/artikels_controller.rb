class ArtikelsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_filter :restrict_access
  before_action :set_artikel, only: [:show, :update, :destroy]

  # GET /artikels
  # GET /artikels.json
  def index
    @artikels = Artikel.all

    render json: @artikels
  end

  # GET /artikels/1
  # GET /artikels/1.json
  def show
    render json: @artikel
  end

  # POST /artikels
  # POST /artikels.json
  def create
    @artikel = Artikel.new(artikel_params)

    if @artikel.save
      render json: @artikel, status: :created, location: @artikel
    else
      render json: @artikel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artikels/1
  # PATCH/PUT /artikels/1.json
  def update
    @artikel = Artikel.find(params[:id])

    if @artikel.update(artikel_params)
      head :no_content
    else
      render json: @artikel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artikels/1
  # DELETE /artikels/1.json
  def destroy
    @artikel.destroy

    head :no_content
  end

  private

    def set_artikel
      @artikel = Artikel.find(params[:id])
    end

    def artikel_params
      params.require(:artikel).permit(:title, :content)
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(token: token)
      end
    end
end
