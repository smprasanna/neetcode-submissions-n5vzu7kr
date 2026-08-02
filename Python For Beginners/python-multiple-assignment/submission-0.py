msg1, msg2 = "World", "Hello"
msg3, msg4, msg5 = "Name", "Is", "My"
# Don't change the code above this line

msg1, msg2 = msg2, msg1
msg3, msg4, msg5 = msg5, msg3, msg4


# Don't change the code below this line
print(msg1)
print(msg2)
print(msg3)
print(msg4)
print(msg5)


# Summary (Tuple Unpacking)

    # Python evaluates the right-hand side first in multiple assignment.
    # msg2, msg1 is temporarily stored as ("World", "Hello").
    # That temporary result is then simultaneously unpacked into msg1 and msg2.
    # Because assignment is not sequential, values are not overwritten.
    # This is why the result is "World", "Hello" and not "World", "World".