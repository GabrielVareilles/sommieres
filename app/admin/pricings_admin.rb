Trestle.resource(:pricings) do
  menu do
    item :tarifs, icon: "fa fa-money", group: :gestion_tarifaire
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :description
    column :prix do |record|
      number_to_currency(record.price, unit: "€", format: '%n %u')
    end
    actions do |action|
      action.edit
    end
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |pricing|
    text_field :name
    text_area :description
    number_field :price
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:pricing).permit(:name, ...)
  # end
end
