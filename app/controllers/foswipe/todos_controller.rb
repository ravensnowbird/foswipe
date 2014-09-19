require_dependency "foswipe/application_controller"

module Foswipe
  class TodosController < ApplicationController
    before_action :set_ticket, only: [:create ,  :destroy , :update]
    before_action :set_todo, only: [:destroy , :update]
    before_action  :todo_params, only: [:create, :update]
    def create
      @ticket.todos.create(todo_params)
      respond_to do |format|
        format.html { redirect_to @ticket, notice: 'Todo was successfully Created.' }
        format.json { head :no_content }
      end
    end
    
    def update
      respond_to do |format|
        if @todo.update(todo_params)
          format.html { redirect_to @ticket, notice: 'Todo was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def destroy
      @todo.delete
      respond_to do |format|
        format.html { redirect_to @ticket, notice: 'Todo was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    private

    def todo_params
      params.require(:todo).permit(:content,:completed)
    end
    def set_ticket
      @ticket = Foswipe::Ticket.find(params[:ticket_id])
    end
    def set_todo
      @todo   = Foswipe::Todo.find(params[:id])
    end
  end
end
