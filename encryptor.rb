class Encryptor
  attr_accessor :encrypt
  # def cipher
  #   {'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q',
  #    'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
  #    'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y',
  #    'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
  #    'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
  #    'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k',
  #    'y' => 'l', 'z' => 'm'}
  # end

  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_character = characters.rotate(rotation)
    Hash[characters.zip(rotated_character)]
  end

  def encrypt_letter(letter,rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def encrypt(string, rotate)
    # 1. Cut the input string into letters
    letters = string.split('')
   # 2. Encrypt those letters one at a time, gathering the results
   result = letters.map {|letter| encrypt_letter = encrypt_letter(letter, rotate) }.join('')
  end

  def decrypt(string, rotate)
    encrypt(string, -rotate)
    # letters = string.split('')
    # result = letters.map {|letter| encrypt_letter = encrypt_letter(letter) }.join('')
  end

end

e = Encryptor.new
encrypt_result_letter =  e.encrypt_letter("a", 1)
p encrypt_result_letter

encrypt_result =  e.encrypt("Hello" , 13)
puts "This is the encrypted message: "
p encrypt_result
decrypt_result = e.decrypt(encrypt_result, 13)
p decrypt_result

# puts "This is the decrypted message:"
# p e.decrypt(encrypt_result)











