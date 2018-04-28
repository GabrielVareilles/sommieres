Trestle.resource(:reservations) do
  menu do
    item :reservations, icon: "fa fa-book", group: :gestion_operationnelle
  end

  # Customize the table columns shown on the index view.
  scope :all, -> { Reservation.includes(:user).all }, default: true

  table do
    column :titulaire do |record|
      record.user.profile.full_name
    end
    column :type do |record|
      "#{record.modifier.name} - #{record.modifier.percent}%"
    end
    column :status do |record|
      # TODO move this in model or decorator
      case record.status
      when 'pending' then tag = :warning
      when 'accepted' then tag = :primary
      when 'payed' then tag = :success
      end
      status_tag(record.status, tag)
    end
    column :début do |record|
      record.start
    end
    column :fin do |record|
      record.stop
    end
    column :prix_total do |record|
      number_to_currency(record.total_price, unit: "€", format: '%n %u')
    end
    column :personnes, align: :center do |record|
      record.people_count
    end
    column :nuités, align: :center do |record|
      record.night_count
    end
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |reservation|
    row do
      col(xs: 3) { select :user_id, User.includes(:profile).all, label: 'Personne principale' }
      col(xs: 3) { select :modifier_id, Modifier.all, label: 'Saison' }
      col(xs: 3) { date_field :start, label: "Jour d'arrivée" }
      col(xs: 3) { date_field :stop, label: "Jour de départ"  }
    end
    render 'items'
  end

  controller do
    def item
      Item.find(params[:item_id]).destroy
      redirect_to edit_reservations_admin_path(Reservation.find(params[:id]))
    end

    def user
      ItemUser.find(params[:user_id]).destroy
      redirect_to edit_reservations_admin_path(Reservation.find(params[:id]))
    end
  end

  routes do
    delete :item, on: :member
    delete :user, on: :member
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:reservation).permit(:name, ...)
  # end
end
