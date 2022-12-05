class NeumannMethod
  def initialize(distribution = LaplaceDistribution.new)
    @distribution = distribution
    @min = distribution.getMin
    @max = distribution.getMax

    @sum = 0
    @sqSum = 0
  end

  def getMean(n)
    @sum / n
  end

  def getVariance(n)
    (@sqSum - (getMean(n) ** 2) * n) / (n - 1)
  end

  def getDeviation(n)
    Math.sqrt(getVariance(n) / n)
  end

  def countNeumannMethod
    while true
      x = @min + (@max - @min) * rand(0..0.99)
      y = @distribution.maximumProbabilityDensity * rand(0..0.99)
      if @distribution.probabilityDensityDistribution(x) > y
        @sum += x
        @sqSum += x ** 2
        return x
      end
    end
  end
end
