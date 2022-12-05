class InverseFunctionMethod

  def initialize(distribution = LaplaceDistribution.new)
    @M = distribution.getM
    @B = distribution.getB

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

  def countInverseFunction
    x = -@B * Math.log(rand(0..0.99))
    if rand(0..0.99) <= 0.5
      x *= -1.0
    end

    tmp = x + (@M / @B)
    @sum += tmp
    @sqSum += tmp ** 2
    tmp
  end

end
