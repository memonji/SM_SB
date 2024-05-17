# Project: An exploration of Semantic Maps in sighted and blind individuals
# Author: Emma Angela Montecchiari
# Requirements: Python 3.0 version

# This script is used in the process of creating the stimuli for the experiment.
# Specifically, it creates the pairs of word stimuli needed.

# Using this script, from a .txt file with a given set of words,
# it creates all possible pairs between them without repetitions
# (e.g., it considers 'ball-sun' and 'sun-ball' as the same pair and computes just one).
# The .txt file is 1 word : 1 line, without empty lines.

# You can easily run it from the terminal using [python3 create_pairs.py], and it will generate a new file
# in the specified directory. You can input the directories of the input and output files in lines 92-93.

#############################################################################################################

def read_words_from_file(file_name):
    try:
        with open(file_name, 'r') as file:
            words = [line.strip() for line in file]
        return words
    except FileNotFoundError:
        raise FileNotFoundError(f"File '{file_name}' not found.")
    except Exception as e:
        raise Exception(f"Error reading '{file_name}': {str(e)}")

def combinations(iterable, r):
    # Convert the input iterable into a tuple
    pool = tuple(iterable)
    n = len(pool)
    # If 'r' is greater than 'n', return early as we can't generate any combinations
    if r > n:
        return
    # Convert the pool to a list comprehension, this ensures we have a mutable copy of the pool
    pool = [word for word in pool]
    n = len(pool)
    # Initialize indices as a list of 'r' numbers starting from 0
    indices = list(range(r))
    # Create the initial combination based on the indices
    result = tuple(pool[i] for i in indices)
    while True:
        # Check if the current result has more than one word and no empty strings
        if len(result) > 1 and all(word != "" for word in result):
            # Yield the current result as a valid combination
            yield result
        # Find the rightmost index that can be incremented
        for i in reversed(range(r)):
            if indices[i] != i + n - r:
                break
        else:
            # If all indices are at their maximum, we are done
            return
        # Increment the rightmost index that can be incremented
        indices[i] += 1
        # Update the following indices to the right of the incremented index
        for j in range(i + 1, r):
            indices[j] = indices[j - 1] + 1
        # Update the result with the new combination based on the updated indices
        result = tuple(pool[i] for i in indices)

def generate_pairs(words):
    try:
        pairs = list(combinations(words, 2))
        return pairs
    except Exception as e:
        raise Exception(f"Error generating pairs: {str(e)}")

def write_pairs_to_file(pairs, output_file):
    try:
        i = 0
        with open(output_file, 'w') as file:
            for pair in pairs:
                file.write(pair[0] + ',' + pair[1] + '\n')
                i += 1
            print("There are " + str(i) + " pairs")
            print("There are " + str(i * 2) + " words")
    except Exception as e:
        raise Exception("Error writing to '{output_file}': {str(e)}")

def main():
    # MODIFIABLE WITH FILE PATHS OF WORDS AND PAIRS
    input_file = './stimuli_single_words.txt'
    output_file = './stimuli_pairs.txt'
    try:
        words = read_words_from_file(input_file)
        pairs = generate_pairs(words)
        write_pairs_to_file(pairs, output_file)
        print(f"All pair combinations generated and saved to '{output_file}' successfully.")
    except Exception as e:
        print('An error occurred: {str(e)}')

if __name__ == "__main__":
    main()
