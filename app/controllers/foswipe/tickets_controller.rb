class Foswipe::TicketsController < Foswipe::ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authorise_filter, :only => [:index, :new, :create]
  skip_before_filter :verify_authenticity_token, :only => [:create_from_email]
  skip_before_action :authenticate_user!, :only => [:create_from_email]

  # GET /tickets
  # GET /tickets.json
  def index
    @user = Foswipe::User.find(current_user.id)
    @agents = Foswipe::User.agents
    @group = Foswipe::UserGroup.all
    
    
    if current_user.admin_or_agent?
      @tickets = Foswipe::Ticket.filter(params.slice(:agents, :groups, :created_at, :status, :ticket_type, :source, :priority, :search))
    else
      @tickets = current_user.all_tickets
    end

  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @comments = @ticket.ticket_comments
    @agents = Foswipe::User.agents
    @user = Foswipe::User.find(current_user.id)
  end

  # GET /tickets/new
  def new
    @ticket = Foswipe::Ticket.new
    @ticket_attachment = @ticket.ticket_attachments.build
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
        format.html { redirect_to tickets_path, notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end

  end

  def create_from_email
    Foswipe::TicketMailer.recieve(params[:message])
    render :nothing => true, :status => 200
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to tickets_url, notice: 'Status was successfully updated.' }
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
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully deleted.' }
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
    params.require(:ticket).permit(:description, :client_id, :support_id, :status, :title, :priority, :author, :support_notes, :ticket_attachments_attributes => [:attachment], :ticket_comments_attributes => [:content, :comment_attachments => [:attachment]])
  end
end
