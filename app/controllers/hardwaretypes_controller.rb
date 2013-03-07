class HardwaretypesController < ApplicationController
  before_filter :authenticate_user!

  # GET /hardwaretypes
  # GET /hardwaretypes.json
  def index
    @hardwaretypes = Hardwaretype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hardwaretypes }
    end
  end

  # GET /hardwaretypes/1
  # GET /hardwaretypes/1.json
  def show
    @hardwaretype = Hardwaretype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hardwaretype }
    end
  end

  # GET /hardwaretypes/new
  # GET /hardwaretypes/new.json
  def new
    @hardwaretype = Hardwaretype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hardwaretype }
    end
  end

  # GET /hardwaretypes/1/edit
  def edit
    @hardwaretype = Hardwaretype.find(params[:id])
  end

  # POST /hardwaretypes
  # POST /hardwaretypes.json
  def create
    @hardwaretype = Hardwaretype.new(params[:hardwaretype])

    respond_to do |format|
      if @hardwaretype.save
        format.html { redirect_to @hardwaretype, notice: 'Hardwaretype was successfully created.' }
        format.json { render json: @hardwaretype, status: :created, location: @hardwaretype }
      else
        format.html { render action: "new" }
        format.json { render json: @hardwaretype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hardwaretypes/1
  # PUT /hardwaretypes/1.json
  def update
    @hardwaretype = Hardwaretype.find(params[:id])

    respond_to do |format|
      if @hardwaretype.update_attributes(params[:hardwaretype])
        format.html { redirect_to @hardwaretype, notice: 'Hardwaretype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hardwaretype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hardwaretypes/1
  # DELETE /hardwaretypes/1.json
  def destroy
    @hardwaretype = Hardwaretype.find(params[:id])
    @hardwaretype.destroy

    respond_to do |format|
      format.html { redirect_to hardwaretypes_url }
      format.json { head :no_content }
    end
  end
end
