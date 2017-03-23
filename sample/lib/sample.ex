defmodule Sample do
  @moduledoc """
      A sample module to create numbers save,load,split and shuffle them
  """
  @doc """
      creating numbers
  ## Example

      iex> numbers = Sample.createNumbers()
      iex> numbers
      [10, 20, 20, 40, 30, 60, 40, 80, 50, 100, 60, 120]
  """
  def createNumbers() do
      numA = [1,2,3,4,5,6]
      numB = [10,20]
      for num1 <- numA,num2 <- numB do
          num1*num2
      end
  end
  @doc """
      split numbers array which takes `numbers` which is a array of numbers and `index` which is index of array

  ## Example

      iex> {a,b} = Sample.splitNumbers([1,2,3,4,5],2)
      iex> a
      [1,2]
      iex> b
      [3,4,5]
  """
  def splitNumbers(numbers,index) do
      Enum.split(numbers,index)
  end
  @doc """
      shuffle numbers which takes `numbers` which is a array of numbers

  ## Example

      iex> Sample.shuffle([1,2,3,4,5])
      [1,3,2,5,4]
  """
  def shuffleNumbers(numbers) do
      Enum.shuffle(numbers)
  end
  @doc """
      saving numbers which takes `numbers` which is a array of numbers

  ## Example

      iex>Sample.save([1,2,4],"arr_file")
  """
  def save(numbers,file_name) do
      binary=:erlang.term_to_binary(numbers)
      File.write(file_name,binary)
  end
  @doc """
      loading numbers from a `file_name`

  ## Example
      iex> Sample.load("arr_file")
      [1,2,3]
  """
  def load(file_name) do
      {status,binary} = File.read(file_name)
      case status do
        :ok->:erlang.binary_to_term(binary)
        :error->"file doesn't exist"
      end
  end
end
