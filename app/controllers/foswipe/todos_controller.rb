require_dependency "foswipe/application_controller"

module Foswipe
  class TodosController < ApplicationController
    def create
      @ticket = Foswipe::Ticket.find(params[:ticket_id])
      @ticket.todos.create(todo_params)
      respond_to do |format|
        format.html { redirect_to @ticket, notice: 'Todo was successfully Created.' }
        format.json { head :no_content }
      end
    end

    private

    def todo_params
      params.require(:todo).permit(:content)
    end
  end
end
