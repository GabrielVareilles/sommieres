Trestle.resource(:rooms) do
  menu do
    item :chambres, icon: "fa fa-bed"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :description
    column :photos do |record|
      image_tag(record.photos.first, height: '90px')
    end
    actions do |action|
      action.edit
    end
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |room|
    text_field :name
    text_area :description

    row do
      room.photos.each do |photo|
        col(xs: 4) { image_tag(photo, height: '200px') }
      end
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:room).permit(:name, ...)
  # end
end
