class TweetViewController < UIViewController

  extend IB

  outlet :user_name
  outlet :label
  outlet :profile_image

  attr_accessor :tweet, :cached_image

  def viewDidLoad
    super
  end

  def viewWillAppear(animated)
    super
    fill_in_tweet
  end

  def fill_in_tweet
    label.text = tweet.text
    user_name.text = tweet.from_user
    profile_image.image = UIImage.imageWithData(cached_image)
  end

  def add_to_favorites(sender)

  end

end
