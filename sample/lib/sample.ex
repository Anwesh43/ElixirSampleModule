defmodule Sample do
  def createNumbers() do
      numA = [1,2,3,4,5,6]
      numB = [10,20]
      for num1 <- numA,num2 <- numB do
          num1*num2
      end
  end
  def splitNumbers(numbers,index) do
      Enum.split(numbers,index)
  end
  def shuffleNumbers(numbers) do
      Enum.shuffle(numbers)
  end
  def save(numbers) do
      binary=:erlang.term_to_binary(numbers)
      File.write("num_data",binary)
  end
  def load(file_name) do
      {status,binary} = File.read(file_name)
      case status do
        :ok->:erlang.binary_to_term(binary)
        :error->"file doesn't exist"
      end
  end
end
