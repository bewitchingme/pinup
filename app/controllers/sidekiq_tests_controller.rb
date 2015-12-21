class SidekiqTestsController < ApplicationController
  before_action :set_sidekiq_test, only: [:show, :edit, :update, :destroy]

  # GET /sidekiq_tests
  # GET /sidekiq_tests.json
  def index
    @sidekiq_tests = SidekiqTest.all
  end

  # GET /sidekiq_tests/1
  # GET /sidekiq_tests/1.json
  def show
  end

  # GET /sidekiq_tests/new
  def new
    @sidekiq_test = SidekiqTest.new
  end

  # GET /sidekiq_tests/1/edit
  def edit
  end

  # POST /sidekiq_tests
  # POST /sidekiq_tests.json
  def create
    @sidekiq_test = SidekiqTest.new(sidekiq_test_params)

    respond_to do |format|
      if @sidekiq_test.save
        format.html { redirect_to @sidekiq_test, notice: 'Sidekiq test was successfully created.' }
        format.json { render :show, status: :created, location: @sidekiq_test }
      else
        format.html { render :new }
        format.json { render json: @sidekiq_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sidekiq_tests/1
  # PATCH/PUT /sidekiq_tests/1.json
  def update
    respond_to do |format|
      if @sidekiq_test.update(sidekiq_test_params)
        format.html { redirect_to @sidekiq_test, notice: 'Sidekiq test was successfully updated.' }
        format.json { render :show, status: :ok, location: @sidekiq_test }
      else
        format.html { render :edit }
        format.json { render json: @sidekiq_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sidekiq_tests/1
  # DELETE /sidekiq_tests/1.json
  def destroy
    @sidekiq_test.destroy
    respond_to do |format|
      format.html { redirect_to sidekiq_tests_url, notice: 'Sidekiq test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sidekiq_test
      @sidekiq_test = SidekiqTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sidekiq_test_params
      params.require(:sidekiq_test).permit(:text, :count)
    end
end
