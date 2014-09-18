require_dependency "foswipe/application_controller"

module Foswipe
  class TodosController < ApplicationController
    before_action :set_todo, only: [:create ,  :destroy]
    def create
      @ticket.todos.create(todo_params)
      respond_to do |format|
        format.html { redirect_to @ticket, notice: 'Todo was successfully Created.' }
        format.json { head :no_content }
      end
    end
    
    def destroy
      @todo = @ticket.todos.find(params[:id])
      @todo.delete
      respond_to do |format|
        format.html { redirect_to @ticket, notice: 'Todo was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    private

    def todo_params
      params.require(:todo).permit(:content)
    end
    def set_todo
      @ticket = Foswipe::Ticket.find(params[:ticket_id])
    end
  end
end
