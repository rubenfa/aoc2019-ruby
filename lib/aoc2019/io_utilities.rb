module ListLoader
  def read_list_from_file(file)
    IO.read(file).split(',').map { |x| Integer(x) }
  end
end
