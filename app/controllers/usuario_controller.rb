class UsuarioController < ApplicationController
	def index
		@usuarios = Usuario.all

		render json: @usuarios, status: :ok
	end

	def create
		@usuario = Usuario.new (usuario_params)

		@usuario.save
		render json: @usuario, status: :created
	end

	def destroy
		@usuario = Usuario.where(id: params[:id]).first
		if @usuario.destroy
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end

	def show
		@usuario = Usuario.where(id: params[:id]).first

		render json: @usuario, status: :ok
	end

	private

	def usuario_params
		params.require(:usuario).permit(:nombre, :apellido, :usuario, :twitter)
	end
end
