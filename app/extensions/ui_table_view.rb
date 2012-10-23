class UITableView

  attr_accessor :cached_images

  def image_from_url(url, image_view, index_path)
    @cached_images ||= {}
    cached_image_data = @cached_images[index_path.row]

    if cached_image_data
      image_view.image = UIImage.imageWithData(cached_image_data)
    else
      RM::QueueHelper.async_image_from_url(url) do |image_data|
        @cached_images[index_path.row] = image_data

        row = NSArray.arrayWithObject(index_path)
        animation = UITableViewRowAnimationNone
        reloadRowsAtIndexPaths(row, withRowAnimation:animation)
      end
    end
  end

end
