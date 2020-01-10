import calendar
year = 2020
base_income_value = 80
double_income_value = base_income_value * 2
festival_income_value = 300
month = input("please enter current month: ")
monthRange = calendar.monthrange(year,int(month))
mon = {}

festivals = input("please enter festival date: ").split()
festivals = [int(festival) for festival in festivals]

double_income = input("please enter double_income day: ").split()
double_income = [int(di) for di in double_income]

if monthRange[0] == 6:
	week = 0
else:
	week = monthRange[0] + 1

for day in range(1,monthRange[1]+1):
	if week > 6:
		week = 0
	mon[day] = week
	week += 1

def cal_income(dutys):
	sum = 0
	weekday = 0
	weekend = 0
	spe_day = 0
	for duty in dutys:
		if festivals:
			if duty in festivals:
				sum += festival_income_value
				spe_day +=1	
				continue
		if double_income:
			if duty in double_income:
				sum += double_income_value
				weekend +=1
				continue
		if mon[duty] == 6 or mon[duty] == 0:
			sum += double_income_value
			weekend +=1
		else:
			sum += base_income_value
			weekday +=1
	if festivals:
		print ("")
		print ("weekday: "+str(weekday)+"  weekday: "+str(weekend)+"  festivals(300): "+str(spe_day)+"  sum: $"+str(sum))
	else:
		print ("")
		print ("weekday: "+str(weekday)+"  weekday: "+str(weekend)+"  sum: $"+str(sum))		

while True:
	user = {}
	name = input("please enter duty name: ")
	if name == "":
		break
	duty_date = input("please enter duty date: ").split()
	if duty_date == []:
		break
	duty_date = [int(d) for d in duty_date]
	user[name] = duty_date
	cal_income(user[name])

#zhou = input("please enter zhouz's date: ").split()
#print (zhouz)
