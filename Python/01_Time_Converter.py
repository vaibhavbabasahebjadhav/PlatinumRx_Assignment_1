minutes = int(input("Enter minutes: "))

hours = minutes // 60
remaining = minutes % 60

if hours == 1:
    print(f"{hours} hr {remaining} minutes")
else:
    print(f"{hours} hrs {remaining} minutes")