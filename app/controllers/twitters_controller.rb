class TwittersController < ApplicationController
  before_action :set_twitter, only: [:show, :edit, :update, :destroy]

  def index
    @twitters = Twitter.all
  end

  def show
  end

  def new
    @twitter = Twitter.new
  end

  def confirm
    @twitter = Twitter.new(twitter_params)
    render :new if @twitter.invalid?
  end

  def edit
  end

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

  def destroy
    @twitter.destroy
    respond_to do |format|
      format.html { redirect_to twitters_url, notice: 'Twitter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_twitter
    @twitter = Twitter.find(params[:id])
  end

  def twitter_params
    params.require(:twitter).permit(:content)
  end
end
