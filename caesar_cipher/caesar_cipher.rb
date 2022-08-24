def caesar_cipher(message, cipher_key = 3)
  msg_array = message.split('')
  msg_array.each_with_index do |char, index|
    code = char.ord
    case
    when code.between?(65, 90)
      ciphertext = (((code - 65) + cipher_key) % 26) + 65
    when code.between?(97, 122)
      ciphertext = (((code - 97) + cipher_key) % 26) + 97
    when ciphertext.between?(48, 57)
      ciphertext = (((code - 48) + cipher_key) % 10) + 48
    else
      next
    end
    msg_array[index] = ciphertext.chr
  end
  ciphered_message = msg_array.join
end

p caesar_cipher("Bmfy f xywnsl!", -5)