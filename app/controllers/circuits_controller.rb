class CircuitsController < ApplicationController
  before_action :set_circuit, only: [:show, :edit, :update, :destroy]

  # GET /circuits
  # GET /circuits.json
  def index
    @circuits = Circuit.all
  end

  # GET /circuits/1
  # GET /circuits/1.json
  def show
  end

  # GET /circuits/new
  def new
    @circuit = Circuit.new
  end

  # GET /circuits/1/edit
  def edit
  end

  # POST /circuits
  # POST /circuits.json
  def create
    @circuit = Circuit.new(create_params)
    respond_to do |format|
      if @circuit.save
        format.html { redirect_to @circuit, notice: 'Circuit was successfully created.' }
        format.json { render :show, status: :created, location: @circuit }
      else
        flash[:alert] = @circuit.errors
        format.html { render :new }
        format.json { render json: @circuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circuits/1
  # PATCH/PUT /circuits/1.json
  def update
    respond_to do |format|
      if @circuit.update(update_params)
        format.html { redirect_to @circuit, notice: 'Circuit was successfully updated.' }
        format.json { render :show, status: :ok, location: @circuit }
      else
        flash[:alert] = @circuit.errors
        format.html { render :edit }
        format.json { render json: @circuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circuits/1
  # DELETE /circuits/1.json
  def destroy
    @circuit.destroy
    respond_to do |format|
      format.html { redirect_to circuits_url, notice: 'Circuit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circuit
      @circuit = Circuit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circuit_params
      params.require(:circuit).permit(:name, :description, :difficulty)
    end

    def create_params
      p = circuit_params
      extra_params = params.require(:circuit).permit(:submitter_id, :effect_type_ids)
      p[:submitter] = User.find(extra_params[:submitter_id])
      p[:effect_types] = []
      fx_ids = extra_params[:effect_type_ids].split(",")
      fx_ids.each do |fx_id|
        effect_type = EffectType.find(fx_id)
        p[:effect_types].append(effect_type)
      end
      return p
    end

    def update_params
      p = circuit_params
      extra_params = params.require(:circuit).permit(:submitter_id, :effect_type_ids)
      
      if !extra_params[:submitter_id].blank?
        p[:submitter] = User.find(extra_params[:submitter_id])
      end
      
      if !extra_params[:effect_type_ids].blank?
        p[:effect_types] = []
        fx_ids = extra_params[:effect_type_ids].split(",")
        fx_ids.each do |fx_id|
          effect_type = EffectType.find(fx_id) || "nilly"
          p[:effect_types].append(effect_type)
        end
      end
      return p
    end
end
