class SimulationController < ApplicationController
  protect_from_forgery with: :null_session

  # POST /credit_requests
  # POST /credit_requests.json
  def index

    require 'uri'
    require 'openssl'
    require 'net/http'

    url = URI("https://api.us.apiconnect.ibmcloud.com/portal-api-developers-desarrollo/sandbox/creditos_hipotecarios/12/simulaciones")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Post.new(url)
    request["x-ibm-client-id"] = ENV["ID_DEV_BCI"]
    request["content-type"] = 'application/json'
    request["accept"] = 'application/json'

    parameters =  {
      "anosTasaFija" => 2,
      "codMesExclusion" => 0,
      "diaVencimiento" =>  10,
      "indDfl2" =>  false,
      "indPAC" =>  false,
      "mesesGracia" =>  2,
      "seguroHogarContenido" =>  false,
      "seguroCesantia" =>  false,
      "seguroEnfermedadGrave" =>  false,
      "seguroHospitalizacion" =>  false,
      "codeudor" =>  false,
      "codeudorConSeguroDesgravamen" =>  false,
      "seguroCesantiaServiu" =>  0,
      "seguroCesantiaDobleProtecion" =>  false,
      "seguroDesgravamenTitular" =>  false,
      "fechaNacimientoTitular" =>  "",
      "fechaNacimientoCodeudor" =>  "",
      "plazo" =>  5,
      "renta" =>  1200000,
      "valorPropiedadUf" =>  10000,
      "montoCreditoUf" =>  7037,
      "codTipoBienRaiz" =>  "casa",
      "comuna" =>  "Santiago Centro",
      "nombreCliente" =>  "Juan",
      "apellidoCliente" =>  "Soto",
      "emailCliente" =>  "jsoto@mailinator.com",
      "fonoCliente" =>  93849284,
      "ciudad" =>  320,
      "rutCliente" =>  17307813,
      "dvCliente" =>  "7",
      "region" =>  "8",
      "codProducto" =>  12,
      "codSeguro" =>  1
    }


    params.each do |p|
      if parameters.key?(p)
        val = params[p]
        parameters[p] = val
      end
    end

    request.body = JSON[parameters]
    response = http.request(request)

    simulation_result = response.read_body

    c_request = CreditRequest.new
    c_request.data = parameters
    c_request.simulation_response = simulation_result
    c_request.save!

    respond_to do |format|
       format.json  { render :json => simulation_result}
    end
  end

end
