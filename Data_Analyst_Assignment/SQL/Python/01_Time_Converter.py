def convert_minutes(minutes):
    hrs = minutes // 60
    mins = minutes % 60
    print(str(hrs) + " hrs " + str(mins) + " minutes")

m = int(input("Enter minutes: "))
convert_minutes(m)