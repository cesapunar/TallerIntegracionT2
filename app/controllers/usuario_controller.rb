class UsuarioController < ApplicationController
	def index
		@usuarios = Usuario.all

		render json: @usuarios, status: :ok
	end

	def create
		@usuario = Usuario.new (usuario_params)


		if @usuario.save
			render json: @usuario, status: 201
			
		else
			render json: {error: 'La creación ha fallado.'}, status: 500
		end
	end

	def destroy
		@usuario = Usuario.where(id: params[:id]).first
		if @usuario
			if @usuario.destroy
				render status: 204
			else
				render json: {error: 'La eliminación ha fallado'}, status: 500
			end
		else
			render json: {error: 'Usuario no encontrado'}, status: 404	
		end
	end
 	
	def show
		@usuario = Usuario.where(id: params[:id]).first

		if @usuario
			render json: @usuario, status: 200
		else
			render json: {error: 'Usuario no encontrado'}, status: 404
		end
	end

	def edit
		@usuario = Usuario.where(id: params[:id]).first
		if @usuario
			if @usuario.update_attributes(usuario_params)
				render json: @usuario, status: :ok
			else
				render json: {error: 'La modificación ha fallado'}, status: 500
			end
		else
			render json: {error: 'Usuario no encontrado'}, status: 404		
		end

	end

	private

	def usuario_params
		params.require(:usuario).permit(:nombre, :apellido, :usuario, :twitter)
	end
end
