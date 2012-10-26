module RM
  module TableView

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def cell_id(cell_id)
        @cell_id = cell_id
      end

      def cell(outlet, opts = {})
        @cells ||= []

        @cells << {
          outlet: outlet,
          bind: opts[:bind],
          type: opts[:type] || :text
        }
      end

      def table_header(outlet, opts = {})
        @table_header = {
          outlet: outlet,
          height: opts[:height] || 50
        }
      end

    end

    def viewDidLoad
      super

      @cells = self.class.instance_variable_get(:@cells)
      @cell_id = self.class.instance_variable_get(:@cell_id)
      @table_header = self.class.instance_variable_get(:@table_header)

      @table_collection = []
    end

    def table_collection
      @table_collection
    end

    def table_collection=(table_collection)
      @table_collection = table_collection
      tableView.reloadData
    end

    def tableView(table_view, numberOfRowsInSection:section)
      @table_collection.length
    end

    def tableView(table_view, cellForRowAtIndexPath:index_path)
      item = @table_collection[index_path.row]
      cell = table_view.dequeueReusableCellWithIdentifier(@cell_id)

      @cells.each do |c|
        case c[:type]
        when :text
          cell.send(c[:outlet]).text = item.send(c[:bind])
        when :image_from_url
          url = item.send(c[:bind])
          table_view.image_from_url(url, cell.send(c[:outlet]), index_path)
        end
      end

      cell
    end

    def tableView(table_view, viewForHeaderInSection:section)
      return if @table_header.nil?
      self.send(@table_header[:outlet])
    end

    def tableView(table_view, heightForHeaderInSection:section)
      return 0 if @table_header.nil?
      @table_header[:height]
    end

  end
end
