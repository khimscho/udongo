class Backend::FormsController < Backend::BaseController

  before_action :find_model, only: [:edit, :update]
  before_action -> do
    breadcrumb.add t('b.forms'), backend_forms_path
  end

  def index
    @forms = Form.all
  end

  def edit
    @model = Form.find(params[:id].to_i)
  end

  def update
    if @model.update_attributes allowed_params
      redirect_to backend_forms_path, notice: translate_notice(:edited, :form)
    else
      render :edit
    end
  end

  private

  def allowed_params
    params[:form].permit(:identifier, :description)
  end

  def find_model
    @model = Form.find(params[:id].to_i)
  end
end
