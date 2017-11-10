class EvenementsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index]

  def show
    @evenement = Evenement.find(params[:id])
    @evenement_coordinates = { lat: @evenement.latitude, lng: @evenement.longitude }
  end

    def index
    @evenements = Evenement.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@evenements) do |evenement, marker|
      marker.lat evenement.latitude
      marker.lng evenement.longitude
      # marker.infowindow render_to_string(partial: "/evenements/map_box", locals: { flat: flat })
    end
  end

end
