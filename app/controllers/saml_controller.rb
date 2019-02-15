class SamlController < ApplicationController

  def index
  end

  def fingerprint
    data = "-----BEGIN CERTIFICATE-----\n" + params[:content].delete("\r") + "\n-----END CERTIFICATE-----\n"
    cert = OpenSSL::X509::Certificate.new(data)
    @content = OpenSSL::Digest::SHA1.hexdigest(cert.to_der).scan(/../).map{ |s| s.upcase }.join(":")
  end

  def encode
    @content = Base64.encode64(params[:content])
  end

  def decode
    @content = Base64.decode64(params[:content])
  end
end