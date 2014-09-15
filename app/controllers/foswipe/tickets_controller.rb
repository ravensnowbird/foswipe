class Foswipe::TicketsController < Foswipe::ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authorise_filter, :only => [:index, :new, :create]
  # GET /tickets
  # GET /tickets.json
  def index
    @user = Foswipe::User.find(current_user.id)
    @agents = Foswipe::User.agents
    @priority = {"1"=>"Low","2"=>"Medium","3"=>"High","4"=>"Urgent"}
    @tickets = current_user.all_tickets
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @comments = @ticket.ticket_comments
    @comment = Foswipe::Comment.new
    @user = Foswipe::User.all
    @agents = Foswipe::User.agents
  end

  # GET /tickets/new
  def new
    @ticket = Foswipe::Ticket.new
  end

  # GET /tickets/1/edit
  def edit
    @find = true
    @agents = Foswipe::User.where(:agent => true).all
  end

  # POST /tickets
  # POST /tickets.json
  def create

    @ticket = current_user.tickets.new(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to clients_path, notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Foswipe::Ticket.find(params[:id])
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Ticket was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Foswipe::Ticket.find(params[:id])
    authorise_filter @ticket
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:description, :client_id, :support_id, :status, :title, :priority, :author, :support_notes, :ticket_attachments_attributes => [:attachment])
  end
end
