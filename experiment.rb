class Experiment
  def initialize(numberOfExperiments, m = 0.0, b = 1.0, min = 0.0, max = 10.0, numberOfPartitions = 100.0)
    @numberOfExperiments = numberOfExperiments
    @numberOfPartitions = numberOfPartitions
    @M = m
    @B = b
    @min = min
    @max = max

    @distribution = LaplaceDistribution.new(@M, @B, @min, @max)
    @inverseFunctionMethod = InverseFunctionMethod.new(@distribution)
    @neumannMethod = NeumannMethod.new(@distribution)
    @metropolisMethod = MetropolisMethod.new(@distribution)

    @handledExperimentNumber = 0
    @inverseMethodArray = Array.new(numberOfPartitions).fill(0.0)
    @neumannMethodArray = Array.new(numberOfPartitions).fill(0.0)
    @metropolisMethodArray = Array.new(numberOfPartitions).fill(0.0)
    @analyticArray = Array.new(numberOfPartitions).fill(0.0)
  end

  def getResult
    Result.new(@numberOfExperiments, @numberOfPartitions, @min, @max, @distribution.getMean, @distribution.getVariance,
               @distribution.getDeviation(@handledExperimentNumber), @inverseMethodArray, @neumannMethodArray,
               @metropolisMethodArray, @analyticArray, @inverseFunctionMethod.getMean(@handledExperimentNumber),
               @inverseFunctionMethod.getVariance(@handledExperimentNumber), @inverseFunctionMethod.getDeviation(@handledExperimentNumber),
               @neumannMethod.getMean(@handledExperimentNumber), @neumannMethod.getVariance(@handledExperimentNumber),
               @neumannMethod.getDeviation(@handledExperimentNumber), @metropolisMethod.getMean(@handledExperimentNumber),
               @metropolisMethod.getVariance(@handledExperimentNumber), @metropolisMethod.getDeviation(@handledExperimentNumber))
  end

  def processPoint
    @analyticArray = @distribution.getProbabilityDensityArray(@numberOfPartitions)

    while @handledExperimentNumber < @numberOfExperiments
      inverseMethodFunction
      neumannMethodFunction
      metropolisMethodFunction
      @handledExperimentNumber += 1
    end
  end

  def inverseMethodFunction
    tmp = @inverseFunctionMethod.countInverseFunction
    if (@min <= tmp || tmp <= @max)
      addNewValueToArray(tmp, @inverseMethodArray)
    end
  end

  def neumannMethodFunction
    addNewValueToArray(@neumannMethod.countNeumannMethod, @neumannMethodArray)
  end

  def metropolisMethodFunction
    addNewValueToArray(@metropolisMethod.countMetropolisMethod, @metropolisMethodArray)
  end

  def addNewValueToArray(newValue, array = Array.new)
    delta = (@max - @min) / @numberOfPartitions
    j = @min + delta

    i = 0
    while i < @numberOfPartitions
      if newValue <= j
        array[i] = array[i] + 1
        break
      end

      j += delta
      i += 1
    end
  end
end
