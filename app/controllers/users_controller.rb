class UsersController < ApplicationController
  before_action :authenticate_admin!
  def index

    if params[:search]
      @user = User.search(params[:search]).order("created_at DESC")
    else
      @user = User.all.order('created_at DESC')
    end
  end

  def show
    obtenerPdf
  end  

  def new
      @user=User.new;
  end

  def edit
      @user=User.find(params[:id])
  end

  def create
      @user = User.new(param_user);
      if @user.save
        redirect_to users_path
      else
        flash.now[:error] = "No se pudo agregar el registro por favor intente nuevamente en unos segundos"
        redirect_to users_path
      end  
  end

  def update
    @user=User.find(params[:id])
    @user.update(param_user)
    redirect_to user_path
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    if @user.save
      redirect_to users_path
    else
      flash.now[:error] = "No se pudo eliminar el usuario, intente nuevamente en unos segundos"
      redirect_to users_path
    end  
  end

  def param_user
      params.require(:user).permit([:atcodigodearea, :atabonadotelefonico , :atcelularofijo , :atempresa ,:atlocalidadcodigoarea, :ttnombre, :ttdomicilio, :ttlocalidad, :ttdocumento ,:tnombre, :tdomicilio, :tlocalidad, :tdocumento,:unombre, :udomicilio, :ulocalidad, :udocumento, :atimei , :atsim , :crime_id])
  end

  def obtenerPdf
    @user=User.find(params[:id])
    idactual=@user.id
    i=0;
    codigoDeArea=@user.atcodigodearea;
    abonadoTelefonico=@user.atabonadotelefonico;
    celularOFijo=@user.atcelularofijo;
    empresa=@user.atempresa
    localidadCodigoArea=@user.atlocalidadcodigoarea;
    imei=@user.atimei
    sim=@user.atsim

    ttNombreApellido=@user.ttnombre
    ttDomicilio=@user.ttdomicilio
    ttLocalidad=@user.ttlocalidad
    ttDocumento=@user.ttdocumento
    
    tNombreApellido=@user.tnombre
    tDomicilio=@user.tdomicilio
    tLocalidad=@user.tlocalidad
    tDocumento=@user.tdocumento 
    
    uNombreApellido=@user.unombre
    uDomicilio=@user.udomicilio
    uLocalidad=@user.ulocalidad
    uDocumento=@user.udocumento

    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new do
        text"SUPERINTENDENCIA DE INVESTIGACIONES EN FUNCION JUDICIAL"  , :size=>9
        move_down 4
        text"COORDINACION DEPARTAMENTAL DE INVESTIGACIONES LA PLATA" , :size=>9
        move_down 10
        text"Registro interno de Información Vinculada a teléfonos Investigados" , :size=>16 , :align=>:center , :style=>:bold
        move_down 20
        text "ABONADO TELEFONICO", :size=>12 , :style=>:italic
          move_down 15
          text "     Código de área: #{codigoDeArea}", :size=>10
          move_down 5
          text "     Abonado Telefónico: #{abonadoTelefonico}", :size=>10
          move_down 5
          text "     Celular o fijo: #{celularOFijo}", :size=>10
          move_down 5
          text "     Empresa: #{empresa}", :size=>10
          move_down 5
          text "     Localidad del código de área: #{localidadCodigoArea}", :size=>10
          move_down 5
          text "     IMEI: #{imei}", :size=>10
          move_down 5
          text "     SIM: #{sim}", :size=>10
          move_down 20
        text "TITULAR TENTATIVO:", :size=>12 , :style=>:italic
          move_down 15
          text "     Nombre y apellido: #{ttNombreApellido}", :size=>10
          move_down 5
          text "     Domicilio: #{ttDomicilio}", :size=>10
          move_down 5
          text "     Localidad: #{ttLocalidad}", :size=>10
          move_down 5
          text "     Documento: #{ttDocumento}", :size=>10
          move_down 20
        text "TITULAR:", :size=>12 , :style=>:italic
          move_down 15
          text "     Nombre y apellido: #{tNombreApellido}", :size=>10 
          move_down 5
          text "     Domicilio: #{tDomicilio}", :size=>10
          move_down 5
          text "     Localidad: #{tLocalidad}", :size=>10
          move_down 5
          text "     Documento: #{tDocumento}", :size=>10
          move_down 20
        text "USUARIO:", :size=>12 , :style=>:italic
          move_down 15
          text "     Nombre y apellido: #{uNombreApellido}", :size=>10
          move_down 5
          text "     Domicilio: #{uDomicilio}", :size=>10
          move_down 5
          text "     Localidad: #{uLocalidad}", :size=>10
          move_down 5
          text "     Documento: #{uDocumento}", :size=>10
           move_down 20
           text "Requerido en Investigación:", :size=>12 , :style=>:italic
           crimesofuser=Crime.all
           crimesofuser.each do |cof|
              if cof.user_id==idactual
                i=i+1  
                move_down 15
                text "     #{i})  IPP O CAUSA Nro.: #{cof.ippcausanro}", :size=>10
                move_down 5
                text "     Delito: #{cof.delito}", :size=>10
                move_down 5
                text "     Interviene: #{cof.interviene}", :size=>10
                move_down 5
                text "     Fecha de requerimiento: #{cof.fecha}", :size=>10
                move_down 5
                text "     Detalles de la investigación: #{cof.detalles}", :size=>10
                move_down 15
              end
          end  
      end
        send_data pdf.render
      end
     end 
  end 
   
end
