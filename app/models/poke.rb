class Poke < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true

  after_create { self.delay.add_to_accounts_segment }

  def self.create_from_user params
    user = User.find_by_email(params[:email])
    user = User.create(params) if user.nil?
    Poke.where("user_id = ?", user.id).first_or_create(user_id: user.id)
  end

  def add_to_accounts_segment
    begin
      url = "#{ENV["ACCOUNTS_HOST"]}/users/#{self.user_id}/segment_subscriptions.json"
      body = {
        token: ENV["ACCOUNTS_API_TOKEN"],
        segment_subscription: {
          organization_id: Organization.find_by_slug('meurio').id,
          segment_id: ENV['SEGMENT_ID']
        }
      }
      HTTParty.post(url, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    rescue Exception => e
      logger.error e.message
    end
  end
end
