class ViaCepService
  include HTTParty
  base_uri 'https://viacep.com.br/ws'

  def self.get_address(cep)
    response = get("/#{cep}/json/")
    if response.success?
      response.parsed_response
    else
      { 'error' => 'CEP não encontrado' }
    end
  end
end
