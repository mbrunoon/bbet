class TechniquesController < ApplicationController
  
  before_action :authorize_request
  before_action :set_technique, only: %i[ show update destroy ]

  # GET /techniques
  def index
    @techniques = Technique.all
    render json: @techniques
  end

  # GET /techniques/1
  def show
    render json: @technique
  end

  # POST /techniques
  def create
    @technique = Technique.new(technique_params)

    if @technique.save
      render json: @technique, status: :created, location: @technique
    else
      render json: @technique.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /techniques/1
  def update
    if @technique.update(technique_params)
      render json: @technique
    else
      render json: @technique.errors, status: :unprocessable_entity
    end
  end

  # DELETE /techniques/1
  def destroy
    @technique.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technique
      @technique = Technique.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def technique_params
      params.require(:technique).permit(:name, :url)
    end
end
