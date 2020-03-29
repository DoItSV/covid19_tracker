class ApplicationController < ActionController::API
  private

  def render_json(serializer, obj, options={})
    if obj.class.name == 'ActiveRecord::Relation'
      return render_collection(serializer, obj, options)
    end

    render_record(serializer, obj, options)
  end

  def render_collection(serializer, collection, options={})
    options = meta_pagination(collection, options)
    render_record(serializer, collection, options)
  end

  def render_record(serializer, record, options={})
    render json: serializer.new(record, options)
  end

  def meta_pagination(paginated_obj, options={})
    options[:meta] = {} unless options.key?(:meta)
    meta_options = options[:meta].merge(generate_pagination(paginated_obj))
    options[:meta] = meta_options
    options
  end

  def generate_pagination(paginated_obj)
    {
      pagination: {
        current_page: paginated_obj.current_page,
        prev_page: paginated_obj.prev_page,
        next_page: paginated_obj.next_page,
        total_pages: paginated_obj.total_pages
      }
    }
  end
end
