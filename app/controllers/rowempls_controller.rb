class RowemplsController < ApplicationController
  #before_filter :authenticate_user!

  # GET /rowempls
  # GET /rowempls.json
  def index
    @rowempls = Rowempl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rowempls }
    end
  end

  # GET /rowempls/1
  # GET /rowempls/1.json
  def show
    @rowempl = Rowempl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rowempl }
    end
  end

  # GET /rowempls/new
  # GET /rowempls/new.json
  def new
    @rowempl = Rowempl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rowempl }
    end
  end

  # GET /rowempls/1/edit
  def edit
    @rowempl = Rowempl.find(params[:id])
  end

  # POST /rowempls
  # POST /rowempls.json
  def create
    @rowempl = Rowempl.new(params[:rowempl])

    respond_to do |format|
      if @rowempl.save
        format.html { redirect_to @rowempl, notice: 'Rowempl was successfully created.' }
        format.json { render json: @rowempl, status: :created, location: @rowempl }
      else
        format.html { render action: "new" }
        format.json { render json: @rowempl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rowempls/1
  # PUT /rowempls/1.json
  def update
    @rowempl = Rowempl.find(params[:id])

    respond_to do |format|
      if @rowempl.update_attributes(params[:rowempl])
        format.html { redirect_to @rowempl, notice: 'Rowempl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rowempl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rowempls/1
  # DELETE /rowempls/1.json
  def destroy
    @rowempl = Rowempl.find(params[:id])
    @rowempl.destroy

    respond_to do |format|
      format.html { redirect_to rowempls_url }
      format.json { head :no_content }
    end
  end
end
