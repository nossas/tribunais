class Poke < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true

  after_create { self.delay.add_to_mailchimp_segment }

  def self.create_from_user params
    user = User.find_by_email(params[:email])
    user = User.create(params) if user.nil?
    Poke.where("user_id = ?", user.id).first_or_create(user_id: user.id)
  end

  def add_to_mailchimp_segment
    if !Rails.env.test?
      begin
        Gibbon::API.lists.subscribe(id: ENV["MAILCHIMP_LIST_ID"], email: {email: self.user.email}, merge_vars: {FNAME: self.user.first_name, LNAME: self.user.last_name, CITY: self.user.city}, double_optin: false, update_existing: true)
        Gibbon::API.lists.static_segment_members_add(id: ENV["MAILCHIMP_LIST_ID"], seg_id: ENV["MAILCHIMP_SEGMENT_ID"], batch: [{email: self.user.email}])
      rescue Exception => e
        Rails.logger.error e
      end
    end
  end
end
