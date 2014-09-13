class Foswipe::SupportsController < Foswipe::ApplicationController
  before_action :set_support, only: [:show, :edit, :update, :destroy]

  # GET /supports
  # GET /supports.json
  def index
   @supports = Foswipe::User.agents if current_user.agent?
    @tickets = current_user.tickets if current_user.agent?
  end

  # GET /supports/1
  # GET /supports/1.json
  def show
    #@ticket = @support.tickets.new
   @tickets = @support.tickets
   
  end

  # GET /supports/new
  def new
    @support = Support.new
  end

  # GET /supports/1/edit
  def edit
  end

  # POST /supports
  # POST /supports.json
  def create
    @support = Support.new(support_params)
    @support.password = "00000000"
    respond_to do |format|
      if @support.save
        format.html { redirect_to admins_path, notice: 'Support was successfully created.' }
        format.json { render action: 'show', status: :created, location: @support }
      else
        format.html { render action: 'new' }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supports/1
  # PATCH/PUT /supports/1.json
  def update
    respond_to do |format|
      if @support.update(support_params)
        format.html { redirect_to @support, notice: 'Support was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supports/1
  # DELETE /supports/1.json
  def destroy
    @support.destroy
    respond_to do |format|
      format.html { redirect_to supports_url }
      format.json { head :no_content }
    end
  end

  def assign_support_notes_to_tickets
    
    @support = Support.find(params[:ticket][:support_id])
    @ticket = Ticket.find(params[:ticket][:ticket_id])
    @ticket.update(:support_notes => params[:ticket][:support_notes])
    respond_to do |format|
      format.html { redirect_to @ticket }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support
      @support = Support.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_params
      params.require(:support).permit(:name, :email, :password)
    end
end
