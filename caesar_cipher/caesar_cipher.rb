def caesar_cipher user_input, shift_factor
  letter_byte = user_input.unpack('c*')
  letter_byte.map! {|x| if x == 32; x - shift_factor; else x end}
  letter_byte.each do |l|
    final_input = [l + shift_factor]
    final_input = final_input.pack('c*')
    print final_input
  end
end

puts "Hi, put your text!"
input = gets.chomp
puts "Now put your shift factor!"
shift = gets.chomp.to_i
puts "Here's your cipher message:"

caesar_cipher input, shift
