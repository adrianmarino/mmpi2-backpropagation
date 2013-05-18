require "./helper"

# Create the network with:
#   2 inputs
#   1 hidden layer with 3 neurons
#   1 outputs
net = Ai4r::NeuralNetwork::Backpropagation.new([2, 3, 1])

example = [[0,0],[0,1],[1,0],[1,1]]
result = [[0],[1],[1],[0]]

# Train the network
400.times do |i|
  j = i % result.length
  puts net.train(example[j], result[j])
end

# Use it: Evaluate data with the trained network
puts "\nEvaluate: 0 , 0 => #{net.eval([0,0])[0].round}"
puts "Evaluate: 0 , 1 => #{net.eval([0,1])[0].round}" 
puts "Evaluate: 1 , 0 => #{net.eval([1,0])[0].round}" 
puts "Evaluate: 1 , 1 => #{net.eval([1,1])[0].round}" 
