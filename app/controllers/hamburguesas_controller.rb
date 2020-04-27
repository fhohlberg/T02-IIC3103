class HamburguesasController < ApplicationController
  
  # GET /hamburguesa
  def index
    @hamburguesas = Hamburguesa.all

    render :json => @hamburguesas.as_json(except: ["created_at", "updated_at", "path", "ingredientes_path"], include: {ingredientes: {only: :path}}), status: "200 resultados obtenidos"
    #render :json => @hamburguesas.map { |hamburguesa| hamburguesa.as_json(:only => :id, :methods => [:nombre, :precio, :descripcion,  :imagen, :ingredientes_path.map {|path| path}) }
  end

  # GET /hamburguesa/1
  def show
    if (params[:id].to_i != 0)
      if Hamburguesa.find_by(id: params[:id])
        @hamburguesa = Hamburguesa.find(params[:id])
        render json: @hamburguesa.as_json(except: ["created_at", "updated_at", "path", "ingredientes_path"], include: {ingredientes: {only: :path}})
      else
        render json: {"status": 404, "error": "hamburguesa inexistente"}, status: 404
      end
    else
        render json: {"status": 400, "error": "id invalido"}, status: 400
    end

  end

  # POST /hamburguesa
  def create
    @hamburguesa = Hamburguesa.new(hamburguesa_params)

    if @hamburguesa.save
      render json: @hamburguesa.as_json(except: ["created_at", "updated_at", "path", "ingredientes_path"], include: {ingredientes: {only: :path}}), status: 201
    else
      render json: {"status": 400, "error": "Input invalido"}, status: 400
    end
  end

  # PATCH /hamburguesa/1
  def update
    if Hamburguesa.find_by(id: params[:id])
      @hamburguesa = Hamburguesa.find(params[:id]) 
      if @hamburguesa.update(hamburguesa_params)
        render json: @hamburguesa.as_json(except: ["created_at", "updated_at", "path", "ingredientes_path"], include: {ingredientes: {only: :path}}), status: 200
      else
        render json: {"status": 400, "error": "Parámetros inválidos"}, status: 400
      end
    else
      render json: {"status": 404, "error": "hamburguesa inexistente"}, status: 404
    end
  end

  # DELETE /hamburguesa/1
  def destroy
    if Hamburguesa.find_by(id: params[:id])
      @hamburguesa = Hamburguesa.find(params[:id]) 
      @hamburguesa.destroy
      render json: {"status": 200, "description": "hamburguesa eliminada"}, status: 200
    else
      render json: {"status": 404, "error": "hamburguesa inexistente"}, status: 404
    end
  end


  private

    # Only allow a trusted parameter "white list" through.
    def hamburguesa_params
      params.require(:hamburguesa).permit(:nombre, :precio, :descripcion, :imagen, :ingredientes)

    end
end
