require 'rest-client'
require 'base64'
require 'digest'

module ZadarmaApi
  class Client
    PROD_URL = 'https://api.zadarma.com'
    SANDBOX_URL = 'https://api-sandbox.zadarma.com'

    def initialize(key, secret, is_sandbox = false)
      @url = is_sandbox ? SANDBOX_URL : PROD_URL
      @key = key
      @secret = secret
    end

    def call(path, request_method = 'GET', params = {}, is_auth = true)
      request_method = request_method.to_s.downcase

      request_params = { format: 'json' }.merge(params)
      headers = is_auth ? auth_header(path, request_params) : {}

      if request_method == 'get'
        query_part = to_query_params(request_params.sort.to_h)
        request_url = "#{request_url(path)}?#{query_part}"

        return RestClient.get request_url, headers
      end

      RestClient.send request_method, request_url(path), request_params, headers
    end

    def request_url(path)
      "#{@url}#{path}"
    end

    def to_query_params(hash)
      return hash.to_query if hash.respond_to? :to_query

      hash.to_a
          .map { |x| "#{CGI.escape(x[0].to_s)}=#{CGI.escape(x[1].to_s)}" }
          .join('&')
    end

    def auth_header(path, request_params)
      params_string = to_query_params(request_params.sort)

      data = "#{path}#{params_string}#{Digest::MD5.hexdigest(params_string)}"

      hmac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), @secret, data)

      signature = Base64.encode64(hmac)

      { Authorization: "#{@key}:#{signature}" }
    end
  end
end
