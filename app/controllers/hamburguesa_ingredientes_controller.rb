class HamburguesaIngredientesController < ApplicationController

  #PUT /hamburguesa/1/ingrediente/1
  def agregar_ingredientes
    if (params[:hamburguesa_id].to_i != 0) && Hamburguesa.find_by(id: params[:hamburguesa_id])
      if (Ingrediente.find_by(id: params[:ingrediente_id]))
        @hamburguesa = Hamburguesa.find(params[:hamburguesa_id])
        @ingrediente = Ingrediente.find(params[:ingrediente_id])
        if !(@hamburguesa.ingredientes.include?(@ingrediente))
          @hamburguesa.ingredientes << @ingrediente 
          @hamburguesa.save()
        end
        render json: {"status": 201, "description": "Ingrediente agregado"}, status: 201
      else
        render json: {"status": 404, "error": "Ingrediente inexistente"}, status: 404
      end
    else
      render json: {"status": 400, "error": "Id de hamburguesa inválido"}, status: 400
    end
  end

  #DELETE /hamburguesa/1/ingrediente/1
  def eliminar_ingredientes
    if (params[:hamburguesa_id].to_i != 0) && Hamburguesa.find_by(id: params[:hamburguesa_id])
      if (Ingrediente.find_by(id: params[:ingrediente_id]))
        @hamburguesa = Hamburguesa.find(params[:hamburguesa_id])
        @ingrediente = Ingrediente.find(params[:ingrediente_id])
        @hamburguesa.ingredientes.delete(@ingrediente)
        @hamburguesa.save()

        render json: {"status": 200, "description": "ingrediente retirado"},status: 200
      else
       render json: {"status": 404, "error": "Ingrediente inexistente en la hamburguesa"}, status: 404
      end
    else 
      render json: {"status": 400, "error": "Id de hamburguesa inválido"}, status: 400
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def hamburguesa_ingrediente_params
      params.require(:hamburguesa_ingrediente).permit(:hamburguesa_id, :ingrediente_id)
    end
end
