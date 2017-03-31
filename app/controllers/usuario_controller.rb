class UsuarioController < ApplicationController
	def index
		@usuarios = Usuario.all
	end

	def create
		@usuario = Usuario.new (usuario_params)

		if params[:usuario][:id]
			render json: {error: 'No se puede crear usuario con id'}, status: 400
		else
			if @usuario.save
				render json: @usuario.to_json, status: 201
				
			else
				render json: {error: 'La creación ha fallado.'}, status: 500
			end
		end
	end

	def destroy
		@usuario = Usuario.where(id: params[:id]).first
		if @usuario
			if @usuario.destroy
				render json: {}, status: 204
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
			render json: @usuario.to_json, status: 200
		else
			render json: {error: 'Usuario no encontrado'}, status: 404
		end
	end

	def edit
		@usuario = Usuario.where(id: params[:uid]).first

		if @usuario
			if params[:usuario][:id]
				render json: {error: 'id no es modificable'}, status: 400
			else
				if @usuario.update_attributes(usuario_params)
					render json: @usuario.to_json, status: :ok
				else
					render json: {error: 'La modificación ha fallado'}, status: 500
				end
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
