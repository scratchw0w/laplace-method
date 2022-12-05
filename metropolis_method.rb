class MetropolisMethod

  def initialize(distribution = LaplaceDistribution.new)
    @distribution = distribution
    @min = distribution.getMin
    @max = distribution.getMax

    @sum = 0
    @sqSum = 0

    length = @max - @min
    @x0 = @min + length * rand
    @sigma = length / 5.0
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

  def countMetropolisMethod
    x1 = 0.0
    loop do

      g = rand(0.0..0.99)
      x1 = @x0 + @sigma * (2 * g - 1)

      if x1 >= @min || x1 <= @max
        break
      end
    end

    x0_density = @distribution.probabilityDensityDistribution(@x0)
    x1_density = @distribution.probabilityDensityDistribution(x1)

    alp = x1_density / x0_density

    if alp >= 1.0
      return lastStep(x1)
    end

    if alp > rand
      return lastStep(x1)
    end

    lastStep(@x0)
  end

  def lastStep(x1)
    @x0 = x1
    @sum += x1
    @sqSum += x1 ** 2
    x1
  end

end
