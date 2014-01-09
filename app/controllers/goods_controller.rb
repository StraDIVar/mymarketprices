class GoodsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.all

    respond_to do |format|
      format.json { render json: @goods }
    end
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
    @good = Good.find(params[:id])

    respond_to do |format|
      format.json { render json: @good }
    end
  end

  # GET /goods/new
  # GET /goods/new.json
  def new
    @good = Good.new

    respond_to do |format|
      format.json { render json: @good }
    end
  end

  # GET /goods/1/edit
  def edit
    @good = Good.find(params[:id])
  end

  # POST /goods
  # POST /goods.json
  def create
    @good = Good.new(params[:good])

    respond_to do |format|
      if @good.save
        format.json { render json: @good, status: :created, location: @good }
      else
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goods/1
  # PUT /goods/1.json
  def update
    @good = Good.find(params[:id])

    respond_to do |format|
      if @good.update_attributes(params[:good])
        format.json { render json: { status: :updated } }
      else
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good = Good.find(params[:id])
    @good.destroy

    respond_to do |format|
      format.json { render json: { status: :deleted } }
    end
  end
end
