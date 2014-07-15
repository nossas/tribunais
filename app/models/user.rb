class User < ActiveRecord::Base
  has_many :pokes

  def self.create params
    if Rails.env.production? || Rails.env.staging?
      begin
        url = "#{ENV["ACCOUNTS_HOST"]}/users.json"
        user_hash = { first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: SecureRandom.hex, application_slug: "naopassarao", ip: params[:ip] }
        body = { token: ENV["ACCOUNTS_API_TOKEN"], user: user_hash }
        response = HTTParty.post(url, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
        logger.info response.inspect
        User.find_by_id(response['id'])
      rescue Exception => e
        logger.error e.message
      end
    else
      super
    end
  end
end
