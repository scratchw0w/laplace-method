
def rewrite(fileName)
  file = File.open(fileName)
  file_data = file.readlines.map(&:chomp).map { |elem| elem.gsub(".", ",") }
  File.write(fileName, file_data.join("\n"))
end

rewrite("output.txt")
rewrite("output_neumann.txt")
rewrite("output_metropolis.txt")
rewrite("output_inverse.txt")
