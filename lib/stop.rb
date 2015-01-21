class Stop

  attr_reader(:station_id, :line_id)

  define_method(:initialize) do |attributes|
    @station_id = station_id
    @line_id = line_id
  end

  define_singleton_method(:all) do
    returned_stops = DB.exec("SELECT * FROM stops;")
    stops = []
    returned_stops.each() do |stop|
      station_id = stop.fetch("station_id")
      line_id = stop.fetch("line_id")
      stops.push(Stop.new({:station_id => station_id, :line_id => line_id}))
    end
    stops
  end

end
