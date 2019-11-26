class TwittersController < ApplicationController
  before_action :set_twitter, only: [:show, :edit, :update, :destroy]

  # GET /twitters
  # GET /twitters.json
  def index
    @twitters = Twitter.all
  end

  # GET /twitters/1
  # GET /twitters/1.json
  def show
  end

  # GET /twitters/new
  def new
    @twitter = Twitter.new
  end

  def confirm
    @twitter = Twitter.new(twitter_params)
    render :new if @twitter.invalid?
  end

  # GET /twitters/1/edit
  def edit
  end

  # POST /twitters
  # POST /twitters.json
  def create
    @twitter = Twitter.new(twitter_params)

    respond_to do |format|
      if @twitter.save
        format.html { redirect_to @twitter, notice: 'Twitter was successfully created.' }
        format.json { render :show, status: :created, location: @twitter }
      else
        format.html { render :new }
        format.json { render json: @twitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twitters/1
  # PATCH/PUT /twitters/1.json
  def update
    respond_to do |format|
      if @twitter.update(twitter_params)
        format.html { redirect_to @twitter, notice: 'Twitter was successfully updated.' }
        format.json { render :show, status: :ok, location: @twitter }
      else
        format.html { render :edit }
        format.json { render json: @twitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitters/1
  # DELETE /twitters/1.json
  def destroy
    @twitter.destroy
    respond_to do |format|
      format.html { redirect_to twitters_url, notice: 'Twitter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter
      @twitter = Twitter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twitter_params
      params.require(:twitter).permit(:content)
    end
end
