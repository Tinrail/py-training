import calendar
year = 2020
base_income_value = 80   #普通日值班费
double_income_value = base_income_value * 2 #周末值班费
festival_income_value = 300  #节日值班费
month = input("please enter current month: ")   #输入要计算那个月的费用
monthRange = calendar.monthrange(year,int(month))
mon = {}

festivals = input("please enter festival date: ").split()  #输入这个月内的节日日期
festivals = [int(festival) for festival in festivals]

double_income = input("please enter double_income day: ").split() #输入因节日产生的双倍值班费日期
double_income = [int(di) for di in double_income]

cl_we = input("please enter cancel weekend double date: ").split()  #属于因调整节假日而取消的周末费日期
cl_we = [int(cw) for cw in cl_we]

if monthRange[0] == 6: 
	week = 0
else:
	week = monthRange[0] + 1

for day in range(1,monthRange[1]+1):
	if week > 6:
		week = 0
	mon[day] = week
	week += 1

def cal_income(dutys,name):
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
			if duty in cl_we:
				sum += base_income_value
				weekday +=1
			else:
				sum += double_income_value
				weekend +=1
		else:
			sum += base_income_value
			weekday +=1
	if festivals:
		print ("")
		print (name+"  ------>  weekday: "+str(weekday)+"  weekday: "+str(weekend)+"  festivals(300): "+str(spe_day)+"  sum: $"+str(sum))
	else:
		print ("")
		print (name+"  ------>  weekday: "+str(weekday)+"  weekday: "+str(weekend)+"  sum: $"+str(sum))

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
	cal_income(user[name],name)

#zhou = input("please enter zhouz's date: ").split()
#print (zhouz)
