module PayByNet
  class StatusVerifier

  	def initialize(status)
  		@status = status
  	end

  	def completed?
    	[2203, 2303].include?(@status)
    end

    def rejected?
      [2202, 2302].include?(@status)
    end

    def outdated?
      [2201, 2301].include?(@status)
    end

    def pending?
      [2101, 2102].include?(@status)
    end

  end
end


