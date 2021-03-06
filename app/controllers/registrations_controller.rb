class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if accepting_invitation?
      new_group_acceptance_path(group)
      clear_used_session_values
    else
      new_user_bank_account_path(resource)
    end
  end

  private

  def accepting_invitation?
    session[:group_invitation_id].present?
  end

  def group
    Group.friendly.find(session[:group_invitation_id])
  end

  def clear_used_session_values
    session.delete(:group_invitation_id)
  end
end
