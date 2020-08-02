class ApplicationController < ActionController::Base
  #CSRF対策
  protect_from_forgery with: :exception

  CHANNEL_SECRET = ENV['LINE_CHANNEL_SECRET']

  private

  #署名検証
  def is_validate_signature
    signature = request.headers["X-LINE-Signature"]
    signature_answer = signature_answer_builder

    render nothing: true, status: 470 unless signature == signature_answer
  end

  def signature_answer_builder
    http_request_body = request.raw_post
    hash = OpenSSL::HMAC::digest(OpenSSL::Digest::SHA256.new, CHANNEL_SECRET, http_request_body)
    Base64.strict_encode64(hash)
  end
end
