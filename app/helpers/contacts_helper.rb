module ContactsHelper

  #<!– blogの確認画面は、new createの時にのみ表示させ、edit updateの際には出現させないようにすること –>
  def choose_new
    if action_name == 'new' || action_name == 'create'
      confirm_contacts_path
    
    #elsif action_name == 'edit' || action_name == 'update'
    #  confirm_contact_path(@contact.id)
    end
  end

  def confirm_new
    unless @contact.id?
      contacts_path
    else
      contact_path(@contact)
    end
  end

  def confirm_form_method
    @contact.id ? 'patch' : 'post'
  end
end
