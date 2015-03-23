class GonzosController < ApplicationController
  before_action :set_gonzo, only: [:show, :edit, :update, :destroy]

  # GET /gonzos
  # GET /gonzos.json
  def index
    @gonzos = Gonzo.all
  end

  # GET /gonzos/1
  # GET /gonzos/1.json
  def show
  end

  # GET /gonzos/new
  def new
    @gonzo = Gonzo.new
  end

  # GET /gonzos/1/edit
  def edit
  end

  # POST /gonzos
  # POST /gonzos.json
  def create
    @gonzo = Gonzo.new(gonzo_params)

    respond_to do |format|
      if @gonzo.save
        format.html { redirect_to @gonzo, notice: 'Gonzo was successfully created.' }
        format.json { render :show, status: :created, location: @gonzo }
      else
        format.html { render :new }
        format.json { render json: @gonzo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gonzos/1
  # PATCH/PUT /gonzos/1.json
  def update
    respond_to do |format|
      if @gonzo.update(gonzo_params)
        format.html { redirect_to @gonzo, notice: 'Gonzo was successfully updated.' }
        format.json { render :show, status: :ok, location: @gonzo }
      else
        format.html { render :edit }
        format.json { render json: @gonzo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gonzos/1
  # DELETE /gonzos/1.json
  def destroy
    @gonzo.destroy
    respond_to do |format|
      format.html { redirect_to gonzos_url, notice: 'Gonzo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gonzo
      @gonzo = Gonzo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gonzo_params
      params.require(:gonzo).permit(:title, :body)
    end
end
