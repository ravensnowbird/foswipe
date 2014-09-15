class Foswipe::ClientsController < Foswipe::ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authorise_filter, :only => [:index, :new, :create]

  # GET /clients
  # GET /clients.json
  def index
      @clients = Foswipe::User.customers
      #@tickets = current_user.tickets if current_user.customer?
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    #@ticket = @client.tickets.new
    @tickets = @client.tickets
  end

  # GET /clients/new
  def new
    @client = Foswipe::User.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Foswipe::User.new(user_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_url, notice: 'Client was successfully created.' }
        format.json { render action: 'show', status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(user_params)
        format.html { redirect_to clients_url, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Foswipe::User.find(params[:id])
      authorise_filter @client
    end
end
