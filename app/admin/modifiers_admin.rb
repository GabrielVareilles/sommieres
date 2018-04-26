Trestle.resource(:modifiers) do
  menu do
    item :modifieurs, icon: "fa fa-percent", group: :gestion_tarifaire
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :description
    column :pourcentage_de_reduction, align: :center do |record|
      100 - record.percent
    end
    actions do |action|
      action.edit
    end
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |modifier|
    text_field :name
    text_field :description
    number_field :percent
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:modifier).permit(:name, ...)
  # end
end
