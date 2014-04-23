
class CreaturesController < ApplicationController
	def index
		@creatures = Creature.all
		render :index
	end

	def new
		render :new
	end

	def create
		creature = params.require(:creature).permit(:name, :kind, :description, :id)
		Creature.create(creature)
		redirect_to "/creatures"
	end

	def show
		creature_id = params[:id]
		@creature = Creature.find(creature_id)
		render :show
	end

	def edit
		creature_id = params[:id]
		@creature = Creature.find(creature_id)
		render :edit
	end

	def update
		creature_id = params[:id]
		creature = Creature.find(creature_id)
		updated_attributes = params.require(:creature).permit(:name, :kind, :description)
		creature.update_attributes(updated_attributes)
		redirect_to "/posts/#{creature_id}"
	end





end