class Foswipe::SupportsController < Foswipe::ApplicationController
  before_action :set_support, only: [:show, :edit, :update, :destroy]
  before_action :authorise_filter, :only => [:index, :new, :create]

  # GET /supports
  # GET /supports.json
  def index
   @supports = Foswipe::User.agents 
    #@tickets = current_user.tickets if current_user.agent?
  end

  # GET /supports/1
  # GET /supports/1.json
  def show
    #@ticket = @support.tickets.new
   @tickets = @support.tickets
   
  end

  # GET /supports/new
  def new
    @support = Foswipe::User.new
  end

  # GET /supports/1/edit
  def edit
  end

  # POST /supports
  # POST /supports.json
  def create
    @support = Foswipe::User.new(user_params)
    @support.agent = true
    respond_to do |format|
      if @support.save
        format.html { redirect_to supports_url, notice: 'Agent was successfully created.' }
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
      if @support.update(user_params)
        format.html { redirect_to supports_url, notice: 'Agent was successfully updated.' }
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
      @support = Foswipe::User.find(params[:id])
      authorise_filter @support
    end

end
