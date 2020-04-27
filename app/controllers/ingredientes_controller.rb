class IngredientesController < ApplicationController

  # GET /ingredientes
  def index
    @ingredientes = Ingrediente.all

    render json: @ingredientes.as_json(except: ["created_at", "updated_at", "path"]), status: "200 resultados obtenidos"
  end

  # GET /ingredientes/1
  def show
    if (params[:id].to_i != 0)
      if Ingrediente.find_by(id: params[:id])
        @ingrediente = Ingrediente.find(params[:id])
        render json: @ingrediente.as_json(except: ["created_at", "updated_at", "path"])
      else
        render json: {"status": 404, "error": "ingrediente inexistente"}, status: 404
      end
    else
      render json: {"status": 400, "error": "id invalido"}, status: 400
    end
  end

  # POST /ingredientes
  def create
    if Ingrediente.find_by(id: params[:id])
      render json: {"status": 400, "error": "Input invalido"}, status: 400
    else
      @ingrediente = Ingrediente.new(ingrediente_params)
      if @ingrediente.save
        @ingrediente.path = ( "https://tarea2-fh-iic3103.herokuapp.com/ingrediente/" + @ingrediente.id.to_s())
        @ingrediente.save()
        render json: @ingrediente.as_json(except: ["created_at", "updated_at", "path"]), status: 201
      else
        render json: {"status": 400, "error": "Input invalido"}, status: 400
      end
    end
  end

  # DELETE /ingredientes/1
  def destroy
    if Ingrediente.find_by(id: params[:id])
      @ingrediente = Ingrediente.find(params[:id])
      @hamburguesa_ingredinte = HamburguesaIngrediente.find_by(ingrediente_id: params[:id])
      if @hamburguesa_ingredinte 
        render json: {"status": 409, "error": "Ingrediente no se puede borrar, se encuentra presente en una hamburguesa"}, status: 409
      else
        @ingrediente.destroy
        render json: {"status": 200, "description": "ingrediente eliminado"}, status: 200
      end
    else
      render json: {"status": 404, "error": "ingrediente inexistente"}, status: 409
    end
  end


  private
    # Only allow a trusted parameter "white list" through.
    def ingrediente_params
      params.require(:ingrediente).permit(:id, :nombre, :descripcion, :path)
    end
end
