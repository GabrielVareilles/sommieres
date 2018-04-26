Trestle.resource(:rooms) do
  menu do
    item :chambres, icon: "fa fa-bed", group: :accomodations
  end

  scope :all, default: true
  scope :disponible, -> { Room.available }
  scope :indisponible, -> { Room.unavailable }

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :description
    column :disponibilité do |record|
      status = record.status == 'disponible' ? 'disponible' : 'indisponible'
      case status
      when 'disponible'
        status_tag(icon("fa fa-check"), :success)
      when 'indisponible'
        status_tag(icon("fa fa-times"))
      end
    end
    column :expositions do |record|
      html = ''
      record.expositions.each do |exp|
        html += '<span class="badge badge-success">' + exp + '</span></h1><br>'
      end
      html.html_safe
    end
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
    tab :description do
      text_field :name
      text_area :description
      row do
        col(sm: 6) { select :status, Room.statuses.keys }
        col(sm: 6) { collection_check_boxes :expositions, Room.expositions, :to_s, :to_s, include_blank: false  }
      end
    end

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
  params do |params|
    params.require(:room).permit(:name, :description)
  end
end
