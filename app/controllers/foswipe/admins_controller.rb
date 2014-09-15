class Foswipe::AdminsController < Foswipe::ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :authorise_filter, :only => [:index, :new, :create]

  # GET /admins
  # GET /admins.json
  def index
    @admins = Foswipe::User.admins
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Foswipe::User.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Foswipe::User.new(user_params)
    @admin.admin = true
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_url, notice: 'Admin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(user_params)
        format.html { redirect_to admins_url, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end

  def assign_tickets_to_supports
    Ticket.find(params[:ticket][:ticket_id]).update(:support_id => params[:ticket][:support_id])
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Successfully assigned to support team.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Foswipe::User.find(params[:id])
      authorise_filter @admin
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    
end
