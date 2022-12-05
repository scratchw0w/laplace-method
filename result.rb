class Result

  def initialize(numberOfPoints, numberOfPartitions, min, max, mean, variance, deviation,
                 inverseMethodArray = Array.new, neumannMethodArray = Array.new,
                 metropolisMethodArray = Array.new, analyticMethodArray = Array.new,
                 inverseMethodMean, inverseMethodVariance, inverseMethodDeviation,
                 neumannMethodMean, neumannMethodVariance, neumannMethodDeviation,
                 metropolisMethodMean, metropolisMethodVariance, metropolisMethodDeviation)
    @numberOfPoints = numberOfPoints
    @numberOfPartitions = numberOfPartitions
    @min = min
    @max = max
    @mean = mean
    @variance = variance
    @deviation = deviation
    @inverseMethodArray = inverseMethodArray
    @neumannMethodArray = neumannMethodArray
    @metropolisMethodArray = metropolisMethodArray
    @analyticMethodArray = analyticMethodArray
    @inverseMethodMean = inverseMethodMean
    @inverseMethodVariance = inverseMethodVariance
    @inverseMethodDeviation = inverseMethodDeviation
    @neumannMethodMean = neumannMethodMean
    @neumannMethodVariance = neumannMethodVariance
    @neumannMethodDeviation = neumannMethodDeviation
    @metropolisMethodMean = metropolisMethodMean
    @metropolisMethodVariance = metropolisMethodVariance
    @metropolisMethodDeviation = metropolisMethodDeviation
  end

  def getProbabilityDensityArray(arr = Array.new)
    w = (@max - @min) / @numberOfPartitions
    array = Array.new(@numberOfPartitions)

    i = 0
    while i < @numberOfPartitions
      array[i] = arr[i] / @numberOfPoints / w
      i += 1
    end

    array
  end

  def getAnalyticalProbabilityDensityValues
    @analyticMethodArray
  end

  def getInverseMethodArray
    getProbabilityDensityArray(@inverseMethodArray)
  end

  def getNeumannMethodArray
    getProbabilityDensityArray(@neumannMethodArray)
  end

  def getMetropolisMethodArray
    getProbabilityDensityArray(@metropolisMethodArray)
  end

  def getMean
    @mean
  end

  def getVariance
    @variance
  end

  def getDeviation
    @deviation
  end

  def getInverseMethodMean
    @inverseMethodMean
  end

  def getInverseMethodVariance
    @inverseMethodVariance
  end

  def getInverseMethodDeviation
    @inverseMethodDeviation
  end

  def getNeumannMethodMean
    @neumannMethodMean
  end

  def getNeumannMethodVariance
    @neumannMethodVariance
  end

  def getNeumannMethodDeviation
    @neumannMethodDeviation
  end

  def getMetropolisMethodMean
    @metropolisMethodMean
  end

  def getMetropolisMethodVariance
    @metropolisMethodVariance
  end

  def getMetropolisMethodDeviation
    @metropolisMethodDeviation
  end

end
