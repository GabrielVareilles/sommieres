Trestle.resource(:profiles) do
  menu do
    item "Profils famille / invités", icon: "fa fa-user-circle", group: :gestion_utilisateurs
  end

  scope :all, -> { Profile.includes(:user).all }, default: true
  scope :famille, -> { Profile.includes(:user).where.not(user: nil) }
  scope :invités, -> { Profile.includes(:user).where(user: nil) }

  search do |query|
    if query
      Profile.where("lower(first_name) LIKE :query", query: "%#{query.downcase}%")
             .or(Profile.where("lower(last_name) LIKE :query", query: "%#{query.downcase}%"))
    else
      Profile.all
    end
  end
  # Customize the table columns shown on the index view.
  #
  scope :all, -> { Profile.includes(:user).all }, default: true

  table do
    column :email do |record|
      record.user ? record.email : 'Profil invité'
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
