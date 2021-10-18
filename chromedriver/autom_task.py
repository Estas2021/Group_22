from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.action_chains import ActionChains

s = Service("C:\\Users\\stas1\\PycharmProjects\\testTask\\chromedriver\\chromedriver_win32\\chromedriver.exe")
driver = webdriver.Chrome(service=s)

driver.get("https://www.google.com/")
driver.implicitly_wait(10)
search = driver.find_element(By.XPATH,"//*[contains(@class,'gsfi')][2]")
search.send_keys('Калькулятор', Keys.ENTER)

sum1 = driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[1]/div/div")
multi = driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[4]/div/div")
sum2 = driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[2]/div/div")
subtrctn = driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[4]/div/div")
sum3 = driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[3]/div/div")
plus = driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[4]/div/div")
sum4 = driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[1]/div/div")
ravno = driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[3]/div/div")

ActionChains(driver).click(sum1).click(multi).click(sum2).click(subtrctn).click(sum3).click(plus).click(sum4).click(ravno).perform()

expected_result = 0
actual_result = driver.find_element(By.XPATH,"//*[@id='cwos']")




