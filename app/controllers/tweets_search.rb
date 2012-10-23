class TweetsSearchTableViewController < UITableViewController

  extend IB

  outlet :search_bar

  def viewDidLoad
    super
    @collection = []
    @selected_tweet = App.storyboard.initController("CurrentTweet")

    setup_delegates
  end

  def setup_delegates
    search_bar.delegate = self
  end

  # table view delegates

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    tweet = @collection[index_path.row]
    cell = table_view.dequeueReusableCellWithIdentifier("TweetFromSearch")

    url = tweet.profile_image_url
    table_view.image_from_url(url, cell.profile_image, index_path)

    cell.label.text = tweet.text
    cell
  end

  def tableView(table_view, numberOfRowsInSection:section)
    @collection.length
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    reset_search_bar
    tweet = @collection[index_path.row]

    @selected_tweet.tweet = tweet
    @selected_tweet.cached_image = table_view.cached_images[index_path.row]
    App.nav_controller << @selected_tweet
  end

  def tableView(table_view, viewForHeaderInSection:section)
    search_bar
  end

  def tableView(table_view, heightForHeaderInSection:section)
    44
  end

  # search bar delegates

  def searchBarSearchButtonClicked(search_bar)
    search_for_tweets
    reset_search_bar
  end

  def search_for_tweets
    API::Twitter.search(search_bar.text) do |tweets|
      @collection = tweets
      view.cached_images = {}
      view.reloadData
    end
  end

  def reset_search_bar
    search_bar.text = ""
    search_bar.resignFirstResponder
  end

end
