class Backend::Content::Rows::TextsController < BackendController
  before_action :find_model
  layout 'backend/lightbox'

  def update
    if @model.update_attributes allowed_params
      redirect_to content_path
    else
      render :edit
    end
  end

  private

  def find_model
    @model = ::ContentText.find params[:id]
  end

  def allowed_params
    params.require(:content_text).permit(:content)
  end

  def content_path
    column = @model.column
    path = "edit_translation_backend_#{column.row.rowable.class.to_s.downcase}_path"
    send(path, column.row.rowable, locale, anchor: "content-row-#{column.row.id}")
  end
  helper_method :content_path
end