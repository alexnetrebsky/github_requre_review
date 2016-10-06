class TestResultItemsController < ApplicationController
  before_action :set_test_result_item, only: [:show, :edit, :update, :destroy]

  # GET /test_result_items
  # GET /test_result_items.json
  def index
    @test_result_items = TestResultItem.all
  end

  # GET /test_result_items/1
  # GET /test_result_items/1.json
  def show
  end

  # GET /test_result_items/new
  def new
    @test_result_item = TestResultItem.new
  end

  # GET /test_result_items/1/edit
  def edit
  end

  # POST /test_result_items
  # POST /test_result_items.json
  def create
    @test_result_item = TestResultItem.new(test_result_item_params)

    respond_to do |format|
      if @test_result_item.save
        format.html { redirect_to @test_result_item, notice: 'Test result item was successfully created.' }
        format.json { render :show, status: :created, location: @test_result_item }
      else
        format.html { render :new }
        format.json { render json: @test_result_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_result_items/1
  # PATCH/PUT /test_result_items/1.json
  def update
    respond_to do |format|
      if @test_result_item.update(test_result_item_params)
        format.html { redirect_to @test_result_item, notice: 'Test result item was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_result_item }
      else
        format.html { render :edit }
        format.json { render json: @test_result_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_result_items/1
  # DELETE /test_result_items/1.json
  def destroy
    @test_result_item.destroy
    respond_to do |format|
      format.html { redirect_to test_result_items_url, notice: 'Test result item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_result_item
      @test_result_item = TestResultItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_result_item_params
      params.require(:test_result_item).permit(:status, :test_result_id)
    end
end
