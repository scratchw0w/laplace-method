require '../laplace_work/laplace_distribution.rb'
require '../laplace_work/metropolis_method.rb'
require '../laplace_work/neumann_method.rb'
require '../laplace_work/inverse_function_method.rb'
require '../laplace_work/result.rb'
require '../laplace_work/experiment.rb'
require '../laplace_work/util.rb'

file = File.open("input.txt")
file_data = file.readlines.map(&:chomp).map { |elem| elem.to_f }
file.close
M = file_data[0]
B = file_data[1]
min = file_data[2]
max = file_data[3]
number_of_experiments = file_data[4]
number_of_partitions = 100.0

experiment = Experiment.new(number_of_experiments, M, B, min, max, number_of_partitions)
experiment.processPoint
result = experiment.getResult

result_info = Array.new(17)
result_info[0] = "Розподіл Лапласа"
result_info[1] = "Аналітичний метод"
result_info[2] = "Математичне очікування - #{result.getMean}"
result_info[3] = "Дисперсія - #{result.getVariance}"
result_info[4] = "Середньоквадратичне відхилення - #{result.getDeviation}"
result_info[5] = "Метод зворотної функції"
result_info[6] = "Математичне очікування - #{result.getInverseMethodMean}"
result_info[7] = "Дисперсія - #{result.getInverseMethodVariance}"
result_info[8] = "Середньоквадратичне відхилення - #{result.getInverseMethodDeviation}"
result_info[9] = "Метод Неймана"
result_info[10] = "Математичне очікування - #{result.getNeumannMethodMean}"
result_info[11] = "Дисперсія - #{result.getNeumannMethodVariance}"
result_info[12] = "Середньоквадратичне відхилення - #{result.getNeumannMethodDeviation}"
result_info[13] = "Метод Метрополіса"
result_info[14] = "Математичне очікування - #{result.getMetropolisMethodMean}"
result_info[15] = "Дисперсія - #{result.getMetropolisMethodVariance}"
result_info[16] = "Середньоквадратичне відхилення - #{result.getMetropolisMethodDeviation}"

File.write("output.txt", result_info.join("\n"))

length = result.getInverseMethodArray.length
inverse_info = Array.new(length + 1)
neumann_info = Array.new(length + 1)
metropolis_info = Array.new(length + 1)

inverse_info[0] = "X\tInverse function method\tAnalytic method"
neumann_info[0] = "X\tNeumann method\tAnalytic method"
metropolis_info[0] = "X\tMetropolis method\tAnalytic method"

j = 0
i = min
delta = (min.abs + max.abs) / number_of_partitions
while i < max - delta
  inverse_info[j + 1] = "#{i}\t#{result.getInverseMethodArray[j]}\t#{result.getAnalyticalProbabilityDensityValues[j]}"
  neumann_info[j + 1] = "#{i}\t#{result.getNeumannMethodArray[j]}\t#{result.getAnalyticalProbabilityDensityValues[j]}"
  metropolis_info[j + 1] = "#{i}\t#{result.getMetropolisMethodArray[j]}\t#{result.getAnalyticalProbabilityDensityValues[j]}"

  i += delta
  j += 1
end

File.write("output_inverse.txt", inverse_info.join("\n"))
File.write("output_neumann.txt", neumann_info.join("\n"))
File.write("output_metropolis.txt", metropolis_info.join("\n"))

rewrite("output.txt")
rewrite("output_neumann.txt")
rewrite("output_metropolis.txt")
rewrite("output_inverse.txt")
