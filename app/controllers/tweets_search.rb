class TweetsSearchTableViewController < UITableViewController

  extend IB

  def viewDidLoad
    super
    @collection = []
  end

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    item = @collection[index_path.row]
    cell = table_view.dequeueReusableCellWithIdentifier("{YOUR_CELL_ID}")
    cell
  end

  def tableView(table_view, numberOfRowsInSection:section)
    @collection.length
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    selected_row = index_path.row
  end

end
