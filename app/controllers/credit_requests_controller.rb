class CreditRequestsController < ApplicationController
  before_action :set_credit_request, only: [:show, :edit, :update, :destroy]

  # GET /credit_requests
  # GET /credit_requests.json
  def index
    @credit_requests = CreditRequest.all
  end

  # GET /credit_requests/1
  # GET /credit_requests/1.json
  def show
  end

  # GET /credit_requests/new
  def new
    @credit_request = CreditRequest.new
  end

  # GET /credit_requests/1/edit
  def edit
  end

  def last
    @credit_request = CreditRequest.last
    response = {
      "id" => @credit_request.id
    }
    render :json => response.to_json
  end

  # POST /credit_requests
  # POST /credit_requests.json
  def create
    @credit_request = CreditRequest.new(credit_request_params)

    respond_to do |format|
      if @credit_request.save
        format.html { redirect_to @credit_request, notice: 'Credit request was successfully created.' }
        format.json { render :show, status: :created, location: @credit_request }
      else
        format.html { render :new }
        format.json { render json: @credit_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_requests/1
  # PATCH/PUT /credit_requests/1.json
  def update
    respond_to do |format|
      if @credit_request.update(credit_request_params)
        format.html { redirect_to @credit_request, notice: 'Credit request was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_request }
      else
        format.html { render :edit }
        format.json { render json: @credit_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_requests/1
  # DELETE /credit_requests/1.json
  def destroy
    @credit_request.destroy
    respond_to do |format|
      format.html { redirect_to credit_requests_url, notice: 'Credit request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_request
      @credit_request = CreditRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_request_params
      params.require(:credit_request).permit(:call_id, :data)
    end
end
