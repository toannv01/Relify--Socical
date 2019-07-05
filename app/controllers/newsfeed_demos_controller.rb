class NewsfeedDemosController < ApplicationController
  before_action :set_newsfeed_demo, only: [:show, :edit, :update, :destroy]

  # GET /newsfeed_demos
  # GET /newsfeed_demos.json
  def index
    @newsfeed_demos = Post.all
  end

  # GET /newsfeed_demos/1
  # GET /newsfeed_demos/1.json
  def show
  end

  # GET /newsfeed_demos/new
  def new
    @newsfeed_demo = NewsfeedDemo.new
  end

  # GET /newsfeed_demos/1/edit
  def edit
  end

  # POST /newsfeed_demos
  # POST /newsfeed_demos.json
  def create
    @newsfeed_demo = NewsfeedDemo.new(newsfeed_demo_params)

    respond_to do |format|
      if @newsfeed_demo.save
        format.html { redirect_to @newsfeed_demo, notice: 'Newsfeed demo was successfully created.' }
        format.json { render :show, status: :created, location: @newsfeed_demo }
      else
        format.html { render :new }
        format.json { render json: @newsfeed_demo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsfeed_demos/1
  # PATCH/PUT /newsfeed_demos/1.json
  def update
    respond_to do |format|
      if @newsfeed_demo.update(newsfeed_demo_params)
        format.html { redirect_to @newsfeed_demo, notice: 'Newsfeed demo was successfully updated.' }
        format.json { render :show, status: :ok, location: @newsfeed_demo }
      else
        format.html { render :edit }
        format.json { render json: @newsfeed_demo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsfeed_demos/1
  # DELETE /newsfeed_demos/1.json
  def destroy
    @newsfeed_demo.destroy
    respond_to do |format|
      format.html { redirect_to newsfeed_demos_url, notice: 'Newsfeed demo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsfeed_demo
      @newsfeed_demo = NewsfeedDemo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsfeed_demo_params
      params.fetch(:newsfeed_demo, {})
    end
end
