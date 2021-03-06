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
    @circuit = Circuit.new(circuit_params)
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
      if @circuit.update(circuit_params)
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
    params.require(:circuit).permit(
      :name, :description, :difficulty, :submitter_id
    ).merge(effect_type_params)
  end

  def effect_type_params
    ids_string = params[:circuit][:effect_type_ids]
    if ids_string
      p = {effect_types: []}
      fx_ids = ids_string.split(",")
      fx_ids.each do |fx_id|
        fx_type = EffectType.find(fx_id)
        p[:effect_types].append(fx_type) if fx_type
      end
      p
    else
      {}
    end
  end
end
