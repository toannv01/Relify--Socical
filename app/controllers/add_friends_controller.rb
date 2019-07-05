# frozen_string_literal: true

class AddFriendsController < ApplicationController
  before_action :set_add_friend, only: %i[show edit update destroy]

  # GET /add_friends
  # GET /add_friends.json
  def index
    @add_friends = AddFriend.all
  end

  # GET /add_friends/1
  # GET /add_friends/1.json
  def show; end

  # GET /add_friends/new
  def new
    @add_friend = AddFriend.new
  end

  # GET /add_friends/1/edit
  def edit; end

  # POST /add_friends
  # POST /add_friends.json
  def create
    @add_friend = AddFriend.new(add_friend_params)

    respond_to do |format|
      if @add_friend.save
        format.html { redirect_to @add_friend, notice: 'Add friend was successfully created.' }
        format.json { render :show, status: :created, location: @add_friend }
      else
        format.html { render :new }
        format.json { render json: @add_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_friends/1
  # PATCH/PUT /add_friends/1.json
  def update
    respond_to do |format|
      if @add_friend.update(add_friend_params)
        format.html { redirect_to @add_friend, notice: 'Add friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @add_friend }
      else
        format.html { render :edit }
        format.json { render json: @add_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_friends/1
  # DELETE /add_friends/1.json
  def destroy
    @add_friend.destroy
    respond_to do |format|
      format.html { redirect_to add_friends_url, notice: 'Add friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_add_friend
    @add_friend = AddFriend.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def add_friend_params
    params.fetch(:add_friend, {})
  end
end
