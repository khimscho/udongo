class FormDecorator < ApplicationDecorator
  delegate_all

  def datagrid
    @datagrid ||= Udongo::Forms::SubmissionDatagrid.new(object)
  end

  # TODO: See if we can move this to Udongo::Forms::SubmissionDatagrid
  # after Davy's config overhaul.
  def datagrid_fields_configured?
    Udongo.config.forms.send(identifier).datagrid_fields.any?
  end

  def email_present?
    return false if datagrid_fields_configured?
    data.select('DISTINCT name').map(&:name).include?('email')
  end
end
