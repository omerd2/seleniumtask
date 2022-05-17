from selenium import webdriver
from time import sleep
from selenium.webdriver import FirefoxOptions
import argparse
import shutil

parser = argparse.ArgumentParser()
parser.add_argument('-u', '--url', action='store', dest='url', help='Insert the web URL.')
args = parser.parse_args()

URL = args.url

opts = FirefoxOptions()
opts.add_argument("--headless")
browser = webdriver.Firefox(options=opts)
browser.get(URL)
sleep(2)

browser.get_screenshot_as_file("screenshot.png")
shutil.move("/screenshot.png", "/screenshots/screenshot.png")
browser.quit()
print("end..."
