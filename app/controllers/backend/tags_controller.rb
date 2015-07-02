class Backend::TagsController < BackendController
  def index
    tags = ::Tag.where(locale: locale).map do |t|
      { label: t.name, value: t.name }
    end

    render json: tags
  end

  def create
    handle_request do
      create_tag unless tag_exists?
      model.tagged_items.create! tag: find_tag
    end
  end

  def destroy
    handle_request do
      tag = find_tag
      model.tagged_items.where(tag_id: tag.id).destroy_all
    end
  end

  private

  def create_tag
    ::Tag.create(
      locale: params[:locale],
      name: params[:tag],
      slug: params[:tag].parameterize
    )
  end

  def filtered_type
    if polymorphic.type_exists?
      params[:taggable_type]
    else
      raise NameError, 'Type cannot be matched'
    end
  end

  def find_tag
    ::Tag.find_by locale: params[:locale], name: params[:tag]
  end

  def handle_request(&block)
    begin
      yield
    rescue => e
      render json: { error: e.message }
    else
      render json: { tag: params[:tag] }
    end
  end

  def model
    filtered_type.constantize.find params[:taggable_id]
  end

  def polymorphic
    @polymorphic ||= Backend::PolymorphicHelper.new(
      type: params[:taggable_type],
      id: params[:taggable_id]
    )
  end

  def tag_exists?
    ::Tag.exists?(
      locale: params[:locale],
      name: params[:tag],
      slug: params[:tag].parameterize
    )
  end
end