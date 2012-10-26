class TweetsSearchTableViewController < UITableViewController

  extend IB
  include RM::TableView

  outlet :search_bar

  table_header :search_bar, height: 44
  cell_id "TweetFromSearch"

  cell :label, bind: :text
  cell :profile_image, bind: :profile_image_url, type: :image_from_url

  def viewDidLoad
    super

    @selected_tweet = App.storyboard.initController("CurrentTweet")
    setup_delegates
  end

  def setup_delegates
    search_bar.delegate = self
  end

  # table view delegates

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    reset_search_bar
    tweet = @table_collection[index_path.row]

    @selected_tweet.tweet = tweet
    @selected_tweet.cached_image = table_view.cached_images[index_path.row]
    App.nav_controller << @selected_tweet
  end

  # search bar delegates

  def searchBarSearchButtonClicked(search_bar)
    search_for_tweets
    reset_search_bar
  end

  def search_for_tweets
    API::Twitter.search(search_bar.text) do |tweets|
      self.table_collection = tweets
      view.cached_images = {}
    end
  end

  def reset_search_bar
    search_bar.text = ""
    search_bar.resignFirstResponder
  end

end
