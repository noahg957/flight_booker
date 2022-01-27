class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map {|airport| [airport.code, airport.id]}
    @dates = Flight.all.order(departure_time: :asc).map {|flight| [flight.departure_time.strftime('%m/%d/%Y %I:%M %p'), flight.departure_time]}
    @available_flights = Flight.where("to_airport_id = :to_airport_id AND from_airport_id = :from_airport_id", {to_airport_id: search_params[:to_airport_id], from_airport_id: search_params[:from_airport_id]})
    @available_flights = @available_flights.map {|flight| ["#{Airport.find(flight.from_airport_id).code} --> #{Airport.find(flight.to_airport_id).code}, #{flight.departure_time.strftime('%m/%d/%Y %I:%M %p')}",flight.id]}
  end

  private
  def search_params
    params.require(:search).permit( :to_airport_id, :from_airport_id, :departure_time, :number_of_tickets)
  end
end
