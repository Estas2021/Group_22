from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service

class TestAmazonEmptyCart:

    def setup_method(self):
        s = Service('C:\\Users\\stas1\\PycharmProjects\\testTask\\chromedriver\\chromedriver_win32\\chromedriver.exe')
        self.driver = webdriver.Chrome(service=s)
        self.driver.implicitly_wait(5)
        self.driver.get('https://www.amazon.com/')

    def test_empty_cart(self):
        self.driver.find_element(By.ID, 'nav-cart').click()
        actual_text = self.driver.find_element(By.XPATH, '//div[@id="sc-active-cart"]//h2').text
        expected_text = 'Your Amazon Cart is empty'

        assert actual_text == expected_text, f'Expected_result: {expected_text}, but actual result: {actual_text}'

    def test_EmptyCart_zero(self):
        actual_num = self.driver.find_element(By.ID, 'nav-cart-count').text
        expected_num = 0

        assert expected_num == int(actual_num), f'Expected_result: {expected_num}, but actual result: {actual_num}'

    def teardown_method(self):
        self.driver.quit()