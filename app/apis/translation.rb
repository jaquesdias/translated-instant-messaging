class Translation
  def initialize(language)
    @language = language
  end

  def client
    @client ||= ::Faraday.new(url: "http://api.funtranslations.com", ssl: { verify: false }) do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
      faraday.headers['Content-Type']  = 'application/json;'
      faraday.headers['Accept']        = 'application/json'
    end
  end

  def translate(message)
    response = client.get "/translate/#{@language}.json", { text: message }
    if response.status == 200
      parsed = JSON.parse(response.body)
      parsed["contents"]["translated"]
    else
      message
    end
  end
end
