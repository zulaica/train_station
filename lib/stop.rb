class Stop

  attr_reader(:station_id, :line_id)

  define_method(:initialize) do |attributes|
    ##########
    #
    # Dear Joey (Part 2. Don't worry about. It makes sense. I figured this part
    # out after the problem below),
    #
    # So, basically, we stupid damn burned through declaring our stupid damn
    # instance variables and didn't stupid damn fetch them from the stupid damn
    # attributes. Also, since stupid damn databases return strings, I had to set
    # the stupid damn id variables to stupid damn integers.
    #
    # Smooches,
    # David
    #
    # # Broken Code Example
    # @station_id = station_id
    # @line_id = line_id
    # #
    #
    ##########
    @station_id = attributes.fetch(:station_id).to_i()
    @line_id = attributes.fetch(:line_id).to_i()
    ##########
    #
    # Dear Joey,
    #
    # So, basically, the stupid damn Stop#save was freaking out because we were
    # assigning a stupid damn value to stupid damn @id without stupid damn
    # declaring it first when we stupid damn initialized.
    #
    # Smooches,
    # David
    #
    ##########
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

  define_method(:save) do
    result = DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{@station_id}, #{@line_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_stop|
    self.station_id().eql?(another_stop.station_id()).&(self.line_id().eql?(another_stop.line_id()))
  end

end
