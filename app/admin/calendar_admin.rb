Trestle.admin(:calendar) do
  menu do
    group :gestion_operationnelle do
      item :calendrier, icon: "fa fa-calendar"
    end
  end

  controller do
    def index
      @reservations = Reservation.all
      @capacity = Room.total_capacity
    end
  end
end
