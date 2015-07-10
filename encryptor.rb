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


  def encrypt_file(filename, rotation)
    #create the file handle to the input file
    input = File.open("secret.txt", "r")
    #Read the text of the input file
    read_input = input.read
    #Encrypt the text
    encrypted_text = encrypt(read_input, 13)
    #New name for the output file
    output_file = "output.txt.encrypted"
    #Create an output file handle
    out = File.open(output_file, "w")
    #Write out the text
    out.write(encrypted_text)
    #close the file
    out.close
  end
  def decrypt_file(filename, rotation)
    #Create the file handle to the encrypted file
    input = File.open(filename, "r")
    #Read the encrypted text
    read_input = input.read
    #Decrypt the text by passing in the text and rotation
    decrypted_text = decrypt(read_input, 13)
    #Create a name for the decrypted file
    output_file = filename.gsub("encrypted","decrypted")
    # Write out the text
    out = File.open(output_file, 'w')
    out.write(decrypted_text)
    #close the file
    out.close
  end

  def supported_characters
    (' '..'z').to_a
  end

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message,attempt)
    end
  end

end


e = Encryptor.new

puts e.crack "\\qmz&%,N&%%q#,9,Vqxx*,`uyq"
puts "Encrypt a file given:"
p e.encrypt_file("secret.txt",13)

puts "Decrypt file given:"
p e.decrypt_file('output.txt.encrypted', 13)

encrypt_result_letter =  e.encrypt_letter("a", 1)
p encrypt_result_letter

encrypt_result =  e.encrypt("Hello" , 13)
puts "This is the encrypted message: "
p encrypt_result
decrypt_result = e.decrypt(encrypt_result, 13)
puts "This is the decrypted message:"
p decrypt_result