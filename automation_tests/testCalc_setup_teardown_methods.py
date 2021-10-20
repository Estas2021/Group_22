from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.action_chains import ActionChains

class TestCalc:

    def setup_method(self):
        s = Service("C:\\Users\\stas1\\PycharmProjects\\testTask\\chromedriver\\chromedriver_win32\\chromedriver.exe")
        self.driver = webdriver.Chrome(service=s)
        self.driver.implicitly_wait(5)
        self.driver.get("https://www.google.com/")

    def test_calculator_task_0(self):

        search = self.driver.find_element(By.XPATH,"//*[contains(@class,'gsfi')][2]")
        search.send_keys("Калькулятор", Keys.ENTER)

        sum1 = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[1]/div/div")
        multi = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[4]/div/div")
        sum2 = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[2]/div/div")
        subtrctn = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[4]/div/div")
        sum3 = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[3]/div/div")
        plus = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[4]/div/div")
        sum4 = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[1]/div/div")
        ravno = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[3]/div/div")

        ActionChains(self.driver).click(sum1).click(multi).click(sum2).click(subtrctn).click(sum3).click(plus).click(sum4).click(ravno).perform()

        expected_result = 0
        actual_result = self.driver.find_element(By.XPATH,"//span[@class='qv3Wpe']").text

        assert expected_result == int(actual_result), f"Error. Expected_result: {expected_result}, but actual result: {actual_result}"

    def test_calculator_task_2(self):

        search = self.driver.find_element(By.XPATH,"//*[contains(@class,'gsfi')][2]")
        search.send_keys("Калькулятор", Keys.ENTER)

        sum1 = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[2]/div/div")
        multi = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[4]/div/div")
        sum2 = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[2]/div/div")
        subtrctn = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[4]/div/div")
        sum3 = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[3]/div/div")
        plus = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[4]/div/div")
        sum4 = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[1]/div/div")
        ravno = self.driver.find_element(By.XPATH,"//*[@id='rso']/div[1]/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[3]/div/div")

        ActionChains(self.driver).click(sum1).click(multi).click(sum2).click(subtrctn).click(sum3).click(plus).click(sum4).click(ravno).perform()

        expected_result = 2
        actual_result = self.driver.find_element(By.XPATH,"//div[@class='XRsWPe AOvabd' and @jsname='lVjWed']").text

        assert expected_result == int(actual_result), f"Error. Expected_result: {expected_result}, but actual result: {actual_result}"

    def teardown_method(self):
        self.driver.quit()


