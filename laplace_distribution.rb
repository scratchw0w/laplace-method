class LaplaceDistribution

  def initialize(m = 0.0, b = 1.0, min = 0.0, max = 10.0)
    @M = m
    @B = b
    @min = min
    @max = max
  end

  def probabilityDensityDistribution(x)
    1.0 / (2.0 * @B) * Math.exp(-(x - @M).abs / @B)
  end

  def distributionFunction(x)
    if x < @M
      return 1.0 / 2.0 * Math.exp((x - @M) / @B)
    end

    1 - 1.0 / 2.0 * Math.exp(-((x - @M) / @B))
  end

  def getM
    @M
  end

  def getB
    @B
  end

  def getMin
    @min
  end

  def getMax
    @max
  end

  def getMean
    @M
  end

  def getVariance
    2 * (@B * @B)
  end

  def getDeviation(n)
    Math.sqrt(getVariance / n)
  end

  def getProbabilityDensityArray(length)
    array = Array.new(length)
    delta = (@max - @min) / length
    iter = @min + delta
    i = 0
    while iter < @max
      array[i] = probabilityDensityDistribution(iter)
      iter += delta
      i += 1
    end

    array
  end

  def maximumProbabilityDensity
    e = 0.001
    a = @min
    b = @max
    r = 0.618
    x0 = a + (1 - r) * (b - a)
    x1 = a + r * (b - a)
    y0 = distributionFunction(x0)
    y1 = distributionFunction(x1)

    while (b - a) > e
      if y0 <= y1
        a = x0
        x0 = x1
        y0 = distributionFunction(x0)
        x1 = a + r * (b - a)
        y1 = distributionFunction(x1)
      else
        b = x1
        x1 = x0
        y1 = distributionFunction(x1)
        x0 = a + (1 - r) * (b - a)
        y0 = distributionFunction(x0)
      end
    end

    (a + b) / 2
  end

end
