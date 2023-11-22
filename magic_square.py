def build_magic_square(n):
    magic_square = [[0] * n for _ in range(n)]
    morse_sequence = generate_morse_sequence()

    for i in range(n):
        for j in range(n):
            morse_value = next(morse_sequence)
            if morse_value == 0:
                magic_square[i][j] = i * n + j + 1
            else:
                magic_square[i][j] = n * n - (i * n + j)

    return magic_square

def generate_morse_sequence():
    current_word = '0'
    while True:
        for bit in current_word:
            yield int(bit)
        current_word = invert_word(current_word)

def invert_word(word):
    inverted_word = ''
    for bit in word:
        inverted_bit = '0' if bit == '1' else '1'
        inverted_word += inverted_bit
    return inverted_word

n = 8
magic_square = build_magic_square(n)
for row in magic_square:
    print(row)