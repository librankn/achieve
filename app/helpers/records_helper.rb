module RecordsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_records_path
    elsif action_name == 'edit'
      record_path
    end
  end
end