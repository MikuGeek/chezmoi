function compile_run
  if test (count $argv) -eq 0
    echo "Usage: compile_run <cpp_file>"
    return 1
  end

  set cpp_file $argv[1]
  set base_name (basename $cpp_file)
  set dir_path (dirname $cpp_file)

  set output_file "$dir_path/(string replace -r '\.cpp' '' $base_name)"

  if not test -f $cpp_file -o (string match -q "*.cpp" $cpp_file)
    echo "Error: Please provide a valid C++ file"
    return 1
  end

  if g++ -std=c++11 $cpp_file -o $output_file
    echo "Compilation successful!"
    $output_file
    rm $output_file
  else
    echo "Error: Compilation failed!"
    return 1
  end
end
