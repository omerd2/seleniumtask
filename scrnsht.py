from selenium import webdriver
from time import sleep
from selenium.webdriver import FirefoxOptions

opts = FirefoxOptions()
opts.add_argument("--headless")
browser = webdriver.Firefox(options=opts)
browser.get('https://www.python.org')
sleep(2)

browser.get_screenshot_as_file("screenshot.png")
browser.quit()
print("end...")
