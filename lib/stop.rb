class Stop

  attr_reader(:id, :station_id, :line_id)

  define_method(:initialize) do |attributes|
    @station_id = attributes.fetch(:station_id).to_i()
    @line_id = attributes.fetch(:line_id).to_i()
    @id = nil
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

  define_singleton_method(:find_station_lines) do |station_id|
    station_lines = []
    returned_stops = DB.exec("SELECT * FROM stops WHERE station_id = #{station_id};")
    returned_stops.each() do |stop|
      line_id = stop.fetch("line_id").to_i()
      line_name = DB.exec("SELECT name FROM lines WHERE id = #{line_id};").getvalue(0,0)
      station_lines.push(line_name)
    end
    station_lines
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{@station_id}, #{@line_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_stop|
    self.station_id().eql?(another_stop.station_id()).&(self.line_id().eql?(another_stop.line_id()))
  end

end
