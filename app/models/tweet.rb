module Models
  class MMTweet < NanoStore::Model

    attribute :from_user
    attribute :text
    attribute :profile_image_url
    attribute :id_str

  end
end
