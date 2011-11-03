class User < ActiveRecord::Base
  ajaxful_rater

def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["user_info"]["name"]
  end
end


end
