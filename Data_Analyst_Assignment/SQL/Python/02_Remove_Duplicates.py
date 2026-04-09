def remove_duplicates(string):
    result = ""
    string=string.lower()
    for ch in string:
        if ch not in result:
            result = result + ch
    return result

s = input("Enter a string: ")
print(remove_duplicates(s))