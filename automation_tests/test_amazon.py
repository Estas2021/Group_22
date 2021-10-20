import pytest
from selenium import webdriver
from selenium.webdriver import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service

class TestAmazon:

    search_words = ('watch', 't-shirt', 'toys')                                                                  # tuple

    def setup_method(self):
        s = Service('C:\\Users\\stas1\\PycharmProjects\\testTask\\chromedriver\\chromedriver_win32\\chromedriver.exe')
        self.driver = webdriver.Chrome(service=s)
        self.driver.implicitly_wait(5)
        self.driver.get('https://www.amazon.com/')

    @pytest.mark.parametrize('search_query', search_words)
    def test_amazon(self, search_query):
        search = self.driver.find_element(By.ID, 'twotabsearchtextbox')
        search.send_keys(search_query, Keys.ENTER)

        expected_result = f'\"{search_query}\"'
        actual_result = self.driver.find_element(By.XPATH, '//span[@class="a-color-state a-text-bold"]').text

        assert expected_result == actual_result, f'Error. Expected_result: {expected_result}, but actual result: {actual_result}'

    def teardown_method(self):
        self.driver.quit()