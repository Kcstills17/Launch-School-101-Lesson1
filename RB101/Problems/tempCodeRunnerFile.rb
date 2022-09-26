
  alpha_num.include?(input.downcase[counter]) ? (result_array << input[counter])  : counter
counter += 1
  end

 final_result = result_array.join('B