Trestle.resource(:profiles) do
  menu do
    item :utilisateurs, icon: "fa fa-users", group: :gestion_operationnelle
  end

  # Customize the table columns shown on the index view.
  #
  scope :all, -> { Profile.includes(:user).all }, default: true

  table do
    column :email do |record|
      record.user.email
    end
    column :prenom do |record|
      record.first_name
    end
    column :nom do |record|
      record.last_name
    end
    column :age do |record|
      record.age
    end
    actions do |action|
      action.edit
    end
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |profile|
    row do
      col(sm: 6) { text_field_tag(:email, profile.user.email, disabled: true, class: 'form-control') }
    end
    text_field :first_name, label: 'Prénom'
    text_field :last_name, label: 'Nom'
    date_field :birth_date, label: 'Date de naissance'
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:profile).permit(:first_name, :last_name, :birth_date)
  # end
end
