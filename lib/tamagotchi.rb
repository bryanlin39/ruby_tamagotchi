class Tamagotchi
  @@tam_all = {}

  define_method(:initialize) do |name|
    @name = name
    @food = 30
    @rest = 25
    @activity = 20
    @alive = true
    @time = Time.now.to_i
    self.save
  end

  define_method(:save) do
    # @@tam_all[@name] = {
    #   food: @food,
    #   rest: @rest,
    #   activity: @activity,
    #   alive: @alive,
    #   time: @time
    # }
    @@tam_all[@name] = self
  end

  define_method(:time_check) do
    3*(Time.now.to_i - @time)
  end

  define_singleton_method(:all) do
    @@tam_all
  end

  define_method(:name) do
    @name
  end
  define_method(:food) do
    @food
  end
  define_method(:rest) do
    @rest
  end
  define_method(:activity) do
    @activity
  end
  define_method(:alive) do
    @alive
  end

  define_method(:feed) do
    if(@food-self.time_check>=0)
      @food += 1
    else
      @alive = false
    end
    self.save
  end
  define_method(:refresh) do
    if(@rest-self.time_check>=0)
      @rest += 1
    else
      @alive = false
    end
    self.save
  end
  define_method(:play) do
    # @food - self.time_check()
    # @rest - self.time_check()
    # @activity - self.time_check()
    if(@activity-self.time_check>=0)
      @activity += 1
    else
      @alive = false
    end
    self.save
  end

end
