class User < ActiveRecord::Base
  has_many :pokes

  def self.create params
    organization = Organization.find_by_slug('meurio')

    if Rails.env.production? || Rails.env.staging?
      begin
        url = "#{ENV["ACCOUNTS_HOST"]}/users.json"

        user_hash = {
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          password: SecureRandom.hex,
          ip: params[:ip],
          memberships_attributes: [{organization_id: organization.id}]
        }

        body = { token: ENV["ACCOUNTS_API_TOKEN"], user: user_hash }
        response = HTTParty.post(url, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
        User.find_by_id(response['id'])
      rescue Exception => e
        logger.error e.message
      end
    else
      super
    end
  end
end
